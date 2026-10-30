public enum Attribute: Hashable {
    case string(key: String, value: String)
    case bool(key: String)
    
    public var key: String {
        switch self {
        case .string(let key, _): key
        case .bool(let key): key
        }
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.key == rhs.key
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
}
