public enum NodeContent {
    case attribute(Attribute)
    case attributes(Set<Attribute>)
    case child(Node)
}
