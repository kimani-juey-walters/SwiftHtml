public enum HtmlAttributeValue: Sendable {
    case bool(Bool)
    case string(String)
}


public protocol HtmlAttribute {
    var value: HtmlAttributeValue { get }
}


public enum HtmlAttributeType: Sendable {
    case string(String)
    case bool(String)
    case any(String)
    
    public var name: String {
        switch self {
        case .string(let n): n
        case .bool(let n): n
        case .any(let n): n
        }
    }
    
    public init?(name: String, value: String) {
        guard let v: HtmlAttributeType = switch name {
        case "string": .string(value)
        case "bool": .bool(value)
        case "any": .any(value)
        default: nil
        } else { return nil }
        
        self = v
    }
}


public let htmlGlobalAttributes: [HtmlAttributeType] = [
    .string("lang"),
    .string("id"),
    .string("class"),
    .bool("autofocus"),
]


public enum HtmlTagMacroType: String {
    case element = "element"
    case styleElement = "styleElement"
    case customElement = "customElement"
}
