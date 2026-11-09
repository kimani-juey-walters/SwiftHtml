import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import Testing

import HtmlElementAttributeMacro
import EnumCaseDescriptionMacro


let testMacros: [String: Macro.Type] = [
    "EnumCaseDescription": EnumCaseDescriptionMacro.self,
    "HTMLElementAttribute": HTMLElementAttributeMacro.self,
]

@Test
func testEnumCaseDescriptoin() {
    assertMacroExpansion(
        #"""
        @EnumCaseDescription
        enum A {
            case one
            case two(String)
            case `three`(String, String)
            case four(a: String, b: String)
            case four(String?, Optional<String>)
        }
        """#,
        expandedSource: """
        enum A {
            case one
            case two(String)
            case `three`(String, String)
            case four(a: String, b: String)
            case four(String?, Optional<String>)
        
            public static var allCaseDescriptions: [(name: String, parameters: [(label: String?, type: String)]?)] {
                [("one", nil), ("two", Optional([(nil, "String")])), ("`three`", Optional([(nil, "String"), (nil, "String")])), ("four", Optional([(Optional("a"), "String"), (Optional("b"), "String")])), ("four", Optional([(nil, "String?"), (nil, "Optional<String>")]))]
            }
        }
        """,
        macros: testMacros
    )
}

@Test
func testHTMLElementAttribute() {
    assertMacroExpansion(
        #"""
        @HTMLElementAttribute
        enum A {
            case one
            case two(String)
        }
        """#,
        expandedSource: """
        enum A {
            case one
            case two(String)

            case accesskey(String)

            case autocapitalize(String)

            case autocorrect(String)

            case autofocus

            case `class`(String)

            case contenteditable(String)

            case dir(String)

            case draggable(String)

            case enterkeyhint(String)

            case exportparts(String)

            case hidden(String)

            case id(String)

            case inert

            case inputmode(String)

            case `is`(String)

            case itemid(String)

            case itemprop(String)

            case itemref(String)

            case itemscope

            case itemtype(String)

            case lang(String)

            case nonce(String)

            case part(String)

            case popover(String)

            case role(String)

            case slot(String)

            case spellcheck(String)

            case style(String)

            case tabindex(String)

            case title(String)

            case translate(String)

            case virtualkeyboardpolicy(String)

            case writingsuggestions(String)

            case attr(String, String? = nil)

            public static let hidden: Self = .hidden("hidden")
            public static let writingsuggestions: Self = .writingsuggestions("true")
            public static func aria(_ k: String, _ v: String) -> Self { .attr("aria-\\(k)", v) }
            public static func attr(data k: String, _ v: String? = nil) -> Self { .attr("data-\\(k)", v) }

            public var asAttribute: Attribute {
                switch self {
                case .one: .bool(key: "one")
                case .two(let value): .string(key: "two", value: value)
                case .accesskey(let value): .string(key: "accesskey", value: value)
                case .autocapitalize(let value): .string(key: "autocapitalize", value: value)
                case .autocorrect(let value): .string(key: "autocorrect", value: value)
                case .autofocus: .bool(key: "autofocus")
                case .class(let value): .string(key: "class", value: value)
                case .contenteditable(let value): .string(key: "contenteditable", value: value)
                case .dir(let value): .string(key: "dir", value: value)
                case .draggable(let value): .string(key: "draggable", value: value)
                case .enterkeyhint(let value): .string(key: "enterkeyhint", value: value)
                case .exportparts(let value): .string(key: "exportparts", value: value)
                case .hidden(let value): .string(key: "hidden", value: value)
                case .id(let value): .string(key: "id", value: value)
                case .inert: .bool(key: "inert")
                case .inputmode(let value): .string(key: "inputmode", value: value)
                case .is(let value): .string(key: "is", value: value)
                case .itemid(let value): .string(key: "itemid", value: value)
                case .itemprop(let value): .string(key: "itemprop", value: value)
                case .itemref(let value): .string(key: "itemref", value: value)
                case .itemscope: .bool(key: "itemscope")
                case .itemtype(let value): .string(key: "itemtype", value: value)
                case .lang(let value): .string(key: "lang", value: value)
                case .nonce(let value): .string(key: "nonce", value: value)
                case .part(let value): .string(key: "part", value: value)
                case .popover(let value): .string(key: "popover", value: value)
                case .role(let value): .string(key: "role", value: value)
                case .slot(let value): .string(key: "slot", value: value)
                case .spellcheck(let value): .string(key: "spellcheck", value: value)
                case .style(let value): .string(key: "style", value: value)
                case .tabindex(let value): .string(key: "tabindex", value: value)
                case .title(let value): .string(key: "title", value: value)
                case .translate(let value): .string(key: "translate", value: value)
                case .virtualkeyboardpolicy(let value): .string(key: "virtualkeyboardpolicy", value: value)
                case .writingsuggestions(let value): .string(key: "writingsuggestions", value: value)
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
        }
        """,
        macros: testMacros
    )
}
