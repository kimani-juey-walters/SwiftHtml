//import SwiftSyntax
//import SwiftSyntaxBuilder
//import SwiftSyntaxMacros
//import SwiftSyntaxMacrosTestSupport
//import HtmlAttributes
//import Testing
//
//
//let testMacros: [String: Macro.Type] = [
//    "HtmlTag": HtmlTagMacro.self,
//    "HTMLElementAttribute": HTMLElementAttributeMacro.self,
//]
//
//
//let  parameters = htmlGlobalAttributes.map {
//    switch $0 {
//    case .string(let n): "\(n): String? = nil"
//    case .bool(let n): "\(n): Bool = false"
//    case .any(let n): "\(n): some HtmlAttribute? = nil"
//    }
//}.joined(separator: ", ")
//
//@Test
//func testMacro() {
////    assertMacroExpansion(
////        #"""
////        @HtmlTag(attributes: [.string("lang")])
////        struct HeadTag {
////            func callAsFunction(children: () -> some HTML) {}
////        }
////        """#,
////        expandedSource: """
////        struct HeadTag {
////        
////            let tag: String
////        
////            init(tag: String = "head") {
////                self.tag = tag
////            }
////        
////            func callAsFunction(\(parameters), n: String? = nil, m: Bool = false) {
////            }
////        }
////        """,
////        macros: testMacros
////    )
//    
//    assertMacroExpansion(
//        #"""
//        @HTMLElementAttribute
//        enum A {
//            case two
//        }
//        """#,
//        expandedSource: """
//        enum A {
//            case one(String)
//            case two
//        }
//        """,
//        macros: testMacros
//    )
//}
