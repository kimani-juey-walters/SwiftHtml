infix operator >>>

public func >>> <T>(lhs: HTMLElement<T>, rhs: NodeContentConvertible) -> Tag {
    lhs { rhs.asNodeContent }
}

public func >>> (lhs: Tag, rhs: NodeConvertible) -> Tag {
    Tag(
        name: lhs.name,
        attributes: lhs.attributes,
        children: lhs.children + [rhs.asNode],
        isVoidElement: lhs.isVoidElement,
    )
}
