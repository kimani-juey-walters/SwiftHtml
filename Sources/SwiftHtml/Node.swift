public enum Node: CustomStringConvertible {
    case tag(Tag)
    case string(String)
    
    public var description: String {
        switch self {
        case .tag(let tag): String(describing: tag)
        case .string(let string): string
        }
    }
}
