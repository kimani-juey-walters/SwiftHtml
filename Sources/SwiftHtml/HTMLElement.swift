public struct HTMLElement<T: AttributeConvertible & Hashable>: Sendable {
    let name: String
    let isVoid: Bool
    
    init(_ name: String, isVoid: Bool = false) {
        self.name = name
        self.isVoid = isVoid
    }
    
    public func callAsFunction(
        _ attributes: T...,
        @NodeContentBuilder<T> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
    ) -> Tag {
        let (attrs, nodes) = content()
        return Tag(
            name: name,
            attributes: Set(attributes.map { $0.asAttribute }).union(attrs),
            children: nodes,
            isVoidElement: isVoid
        )
    }
}
