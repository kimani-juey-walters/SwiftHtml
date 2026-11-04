infix operator <|

public func <| <T>(lhs: HTMLElement<T>, rhs: NodeContentConvertible) -> Tag {
    lhs { rhs.asNodeContent }
}

public func <| (lhs: Tag, rhs: NodeConvertible) -> Tag {
    lhs.with(children: lhs.children + [rhs.asNode])
}


infix operator |>

public func |> <T>(lhs: String, rhs: HTMLElement<T>) -> Tag {
    rhs { lhs }
}

public func |> (lhs: String, rhs: Tag) -> Tag {
    rhs.with(children: rhs.children + [lhs.asNode])
}
