//import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import HtmlAttributes


enum HtmlTagMacroError: Error {
    case ArgumentError
}


public struct HtmlTagMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        let attrs = (htmlGlobalAttributes + (try getAttributes(node.arguments))).sorted { $0.name < $1.name }
        let isVoid = getIsVoid(node.arguments)
        let type = getType(node.arguments)
        
        let partialParameters = attrs.map {
            switch $0 {
            case .string(let n): "\(n): String? = nil"
            case .bool(let n): "\(n): Bool = false"
            case .any(let n): "\(n): some HtmlAttribute = false"
            }
        }.joined(separator: ",")
        
        let ifStatements: [any ExprSyntaxProtocol] = try attrs.map {
            switch $0 {
            case .string(let n): try IfExprSyntax("if let \(raw: n.quote(keywords: true))") { #"attrs["\#(raw: n)"] = .string(\#(raw: n.quote(keywords: true)))"# }
            case .bool(let n): try IfExprSyntax("if \(raw: n.quote(keywords: true)))") { #"attrs["\#(raw: n)"] = .bool(true)"# }
            case .any(let n): try SwitchExprSyntax("switch \(raw: n).value") {
                    #"case .bool(true): attrs["\#(raw: n)"] = .bool(true)"#
                    #"case .string(let v): attrs["\#(raw: n)"] = .string(v)"#
                    "default: break"
                }
            }
        }
        
        let initilizer = try InitializerDeclSyntax(
            #"init(tag: String = "\#(raw: try getTagName(declaration).lowercased())")"#
        ) { "self.tag = tag" }
       
        
        let (childrenCallback, childrenCallbackResult) = if case .styleElement = type {
           (#"childrenCallback: (() -> String) = {""}"#, "[childrenCallback()]")
        } else {
            ("@HTMLBuilder childrenCallback: (() -> [any HTML]) = {[]}", "childrenCallback()")
        }
        
        let parameters = "\(partialParameters), _ otherAttrs: [String:HtmlAttribute] = [:]" + (isVoid ? "" : ", \(childrenCallback)")
        let children = isVoid ? "[]" : childrenCallbackResult
        
        let callAsFunction = try FunctionDeclSyntax(
            "public func callAsFunction(\(raw: parameters)) -> HTMLNode"
        ) {
            "var attrs = [String: HtmlAttributeValue]()"
            ifStatements
            """
            for (k, v) in otherAttrs {
                switch v.value {
                case .bool(true): attrs[k] = .bool(true)
                case .string(let v): attrs[k] = .string(v)
                default: break
                }
            }
            """
            "return HTMLNode(tag: tag, attributes: attrs, children: \(raw: children), isVoidElement: isVoidElement)"
        }
      
        return [
            "let tag: String",
            "let isVoidElement: Bool = \(raw: isVoid)",
            DeclSyntax(initilizer),
            DeclSyntax(callAsFunction)
        ]
    }
    
    static func getTagName(_ d: some DeclGroupSyntax) throws -> String {
        guard let name = d.as(StructDeclSyntax.self)?.name.text else { throw HtmlTagMacroError.ArgumentError }
        return if let idx = name.dropFirst().firstIndex(where: { $0.isUppercase }) {
            String(name.prefix(upTo: idx))
        } else {
            name
        }
    }
    
    static func getAttributes(_ arguments: AttributeSyntax.Arguments?) throws -> [HtmlAttributeType] {
        guard case .argumentList(let args) = arguments,
              let attrs = args.first(where: { $0.label?.text == "attributes" })?.expression.as(ArrayExprSyntax.self)
        else { return [] }
       
        return try attrs.elements.map {
            guard let fn = $0.expression.as(FunctionCallExprSyntax.self),
                  let name = fn.calledExpression.as(MemberAccessExprSyntax.self)?.declName.baseName.identifier?.name,
                  let segments = fn.arguments.first?.expression.as(StringLiteralExprSyntax.self)?.segments,
                  segments.count == 1,
                  case .stringSegment(let segment) = segments.first,
                  let attr = HtmlAttributeType(name: name, value: segment.content.text)
            else { throw HtmlTagMacroError.ArgumentError }
            return attr
        }
    }


    static func getType(_ arguments: AttributeSyntax.Arguments?) -> HtmlTagMacroType {
        guard case .argumentList(let args) = arguments,
              let type = args.first(where: { $0.label?.text == "type" })?.expression.as(MemberAccessExprSyntax.self)
        else { return .element }
        return HtmlTagMacroType(rawValue: type.declName.baseName.text)!
    }
    
    static func getIsVoid(_ arguments: AttributeSyntax.Arguments?) -> Bool {
        if case .argumentList(let args) = arguments,
              let isVoid = args.first(where: { $0.label?.text == "isVoid" })?.expression.as(BooleanLiteralExprSyntax.self),
              case .keyword(let kw) = isVoid.literal.tokenKind,
              case .`true` = kw
        { true } else { false }
    }
}




//@main
//struct HtmlTagMacroPlugin: CompilerPlugin {
//    let providingMacros: [Macro.Type] = [
//        HtmlTagMacro.self,
//    ]
//}


extension String {
    func quote(keywords: Bool = false) -> String {
        let shouldQuote = if keywords && Constants.keywords.contains(self) { true } else { false }
        return shouldQuote ? "`\(self)`" : self
    }
}

struct Constants {
    static let keywords = ["associatedtype", "borrowing", "class", "consuming", "deinit", "enum", "extension", "fileprivate", "func", "import", "init", "inout", "internal", "let", "nonisolated", "open", "operator", "precedencegroup", "private", "protocol", "public", "rethrows", "static", "struct", "subscript", "typealias", "var", "break", "case", "catch", "continue", "default", "defer", "do", "else", "fallthrough", "for", "guard", "if", "in", "repeat", "return", "switch", "throw", "where", "while", "Any", "as", "await", "catch", "false", "is", "nil", "rethrows", "self", "Self", "super", "throw", "throws", "true", "try", "associativity", "async", "convenience", "didSet", "dynamic", "final", "get", "indirect", "infix", "lazy", "left", "mutating", "none", "nonmutating", "optional", "override", "package", "postfix", "precedence", "prefix", "Protocol", "required", "right", "set", "some", "Type", "unowned", "weak", "willSet"]
}
