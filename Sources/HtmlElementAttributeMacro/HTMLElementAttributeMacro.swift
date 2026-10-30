import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import GlobalAttributes
import Utils


public struct HTMLElementAttributeMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else { throw MacroError.memberTypeError }
        
        let newCases = try GlobalElementAttribute.allCaseDescriptions.map {
            DeclSyntax(try EnumCaseDeclSyntax(SyntaxNodeString(stringLiteral: enumCaseDescription($0))))
        }
        
        let cases = try enumDecl.memberBlock.members
            .compactMap { $0.decl.as(EnumCaseDeclSyntax.self)?.elements }
            .flatMap { $0 }
            .map {
                let name = $0.name.text
                let parameters = try $0.parameterClause?.parameters.map {
                    let type = try getType($0.type)
                    return ($0.firstName?.text, type)
                }
                
                return (name, parameters)
            } + GlobalElementAttribute.allCaseDescriptions
        
        let caseStatements = cases.compactMap {
            switch (noBacktick($0.name), $0.parameters) {
            case (let name, nil):
                """
                case .\(name): .bool(key: "\(name)")
                """
            case (let name, .some(let parameters)) where isSingleStringParameter(parameters):
                """
                case .\(name)(let value): .string(key: "\(name)", value: value)
                """
            case (let name, .some(let parameters)) where isSingleStringOptionalParameter(parameters):
                """
                case .\(name)(nil): .bool(key: "\(name)")
                case .\(name)(.some(let value)): .string(key: "\(name)", value: value)
                """
            default: nil
            }
        }.joined(separator: "\n")
        
        return newCases + [
            """
            case attr(String, String? = nil)
            
            public static let hidden: Self = .hidden("hidden")
            public static let writingsuggestions: Self = .writingsuggestions("true")
            public static func aria(_ k: String, _ v: String) -> Self { .attr("aria-\\(k)", v) }
            public static func attr(data k: String, _ v: String? = nil) -> Self { .attr("data-\\(k)", v) }
            
            public var asAttribute: Attribute {
                switch self {
                \(raw: caseStatements.split(separator: "\n").joined(separator: "\n    "))
                case .attr(let k, .some(let v)): .string(key: k, value: v)
                case .attr(let k, nil): .bool(key: k)
                }
            }
            
            
            public var key: String {
                switch asAttribute {
                case .string(key: let key, value: _): key
                case .bool(key: let key): key
                }
            }
            
            public static func == (lhs: Self, rhs: Self) -> Bool {
                lhs.key == rhs.key
            }
            
            public func hash(into hasher: inout Hasher) {
                hasher.combine(key)
            }
            """
        ]
    }
}


typealias MacroError = HTMLElementAttributeMacroError
enum HTMLElementAttributeMacroError: Error {
    case memberTypeError
}



typealias EnumCaseParameter = (label: String?, type: String)
typealias EnumCase = (name: String, parameters: [EnumCaseParameter]?)

func enumCaseDescription(_ p: EnumCase) -> String {
    let (name, parameters) = p
    return if let parameters {
        "case \(name)(\(parameters.map{ enumCaseParameterDescription($0) }.joined(separator: ", ")))"
    } else {
        "case \(name)"
    }
}

func enumCaseParameterDescription(_ p: EnumCaseParameter) -> String {
    let (label, type) = p
    return if let label {
       "\(label): \(type)"
    } else {
        type
    }
}

func isSingleStringParameter(_ p: [EnumCaseParameter]) -> Bool {
    guard p.count == 1,
          let param = p.first,
          param.label == nil,
          param.type == "String"
    else { return false }
    
    return true
}

func isSingleStringOptionalParameter(_ p: [EnumCaseParameter]) -> Bool {
    guard p.count == 1,
          let param = p.first,
          param.label == nil,
          param.type == "String?" || param.type == "Optional<String>"
    else { return false }
    
    return true
}

func noBacktick(_ s: String) -> String {
    guard s.first == "`", s.last == "`" else { return s }
    return String(s[s.index(after: s.startIndex)..<s.index(before: s.endIndex)])
}


@main
struct HtmlAttributeMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        HTMLElementAttributeMacro.self,
    ]
}
