public protocol NodeContentConvertible {
    var asNodeContent: NodeContent { get }
}

extension NodeContent: NodeContentConvertible {
    public var asNodeContent: NodeContent { self }
}

extension String: NodeContentConvertible {
    public var asNodeContent: NodeContent { .child(self.asNode) }
}


extension Tag: NodeContentConvertible {
    public var asNodeContent: NodeContent { .child(self.asNode) }
}
