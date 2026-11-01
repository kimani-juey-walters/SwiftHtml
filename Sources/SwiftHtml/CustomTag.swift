public func tag(
    _ name: String,
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> Tag {
    let (attrs, nodes) = content()
    return Tag(
        name: name,
        attributes: Set(attributes.map { $0.asAttribute }).union(attrs),
        children: nodes,
        isVoidElement: false
    )
}
