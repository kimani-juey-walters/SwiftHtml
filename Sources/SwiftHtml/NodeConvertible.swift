public protocol NodeConvertible {
    var asNode: Node { get }
}


extension String: NodeConvertible {
    public var asNode: Node { .string(self) }
}


extension Tag: NodeConvertible {
    public var asNode: Node { .tag(self) }
}
