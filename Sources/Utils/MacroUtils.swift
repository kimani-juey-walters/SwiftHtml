import SwiftSyntax


 // Only handles specific cases, might not work in other situations
 public func getType(_ t: TypeSyntax) throws -> String {
     if let type = t.as(IdentifierTypeSyntax.self) {
         let name = type.name.text
         
         guard let arguments = type.genericArgumentClause else { return name }
         let argStr = try arguments.arguments.map {
             // TODO: Handle .expr case
             if case .type(let x) = $0.argument { try getType(x) } else { throw GetTypeError.genericArgumentTypeError }
         }.joined(separator: ", ")
         
         return "\(name)<\(argStr)>"
     } else if let type = t.as(OptionalTypeSyntax.self)  {
         guard let name = type.wrappedType.as(IdentifierTypeSyntax.self)?.name.text
         else { throw GetTypeError.unhandledTypeSyntaxError }
         
         return "\(name)?"
     } else {
         // TODO: handle other shorthand, such as String? above, as needed: [I], [K:V], etc.
         throw GetTypeError.unhandledTypeSyntaxError
     }
 }


public enum GetTypeError: Error {
    case genericArgumentTypeError
    case unhandledTypeSyntaxError
}
