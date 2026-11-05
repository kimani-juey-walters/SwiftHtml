precedencegroup BackwardApplication {
    associativity: right
}

infix operator <|: BackwardApplication

public func <| <T>(lhs: HTMLElement<T>, rhs: NodeContentConvertible) -> Tag {
    lhs { rhs.asNodeContent }
}

public func <| (lhs: Tag, rhs: NodeConvertible) -> Tag {
    lhs.with(children: lhs.children + [rhs.asNode])
}


precedencegroup ForwardApplication {
    associativity: left
}

infix operator |>: ForwardApplication

public func |> <T>(lhs: NodeContentConvertible, rhs: HTMLElement<T>) -> Tag {
    rhs { lhs.asNodeContent }
}

public func |> (lhs: NodeConvertible, rhs: Tag) -> Tag {
    rhs.with(children: rhs.children + [lhs.asNode])
}

public func |> (lhs: String, rhs: ConvenienceAttributes) -> Attribute {
    .string(key: "style", value: lhs)
}


public enum ConvenienceAttributes {
    case style
}
