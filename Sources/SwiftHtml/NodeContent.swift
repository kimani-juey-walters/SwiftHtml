public enum NodeContent: CustomStringConvertible {
    case attribute(Attribute)
    case attributes(Set<Attribute>)
    case child(Node)
    
    public var description: String {
        if case .child(let node) = self { "<!DOCTYPE html>\(node)" } else { "" }
    }
}
