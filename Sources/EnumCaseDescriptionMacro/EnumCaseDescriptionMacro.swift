import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftCompilerPlugin
import Utils


public struct EnumCaseDescriptionMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else { throw MacroError.memberTypeError }
        
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
            }
        
        return [
            """
            public static var allCaseDescriptions: [(name: String, parameters: [(label: String?, type: String)]?)] {
                \(raw: cases)
            }
            """
        ]
    }
}


typealias MacroError = EnumCaseDescriptionMacroError
enum EnumCaseDescriptionMacroError: Error {
    case memberTypeError
}

@main
struct HtmlAttributeMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        EnumCaseDescriptionMacro.self,
    ]
}
