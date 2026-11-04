@resultBuilder
public struct NodeContentBuilder<T: Hashable & AttributeConvertible> {
    public static func buildBlock(_ components: any NodeContentConvertible...) -> [any NodeContentConvertible] {
        components
    }
    
    public static func buildExpression(_ expression: NodeContent) -> NodeContentConvertible {
        expression
    }
    public static func buildExpression(_ expression: Tag) -> NodeContentConvertible {
        expression.asNodeContent
    }
    
    public static func buildExpression(_ expression: String) -> NodeContentConvertible {
        expression.asNodeContent
    }
    
    public static func buildExpression(_ expression: Attribute) -> some NodeContentConvertible {
        NodeContent.attribute(expression)
    }

    public static func buildExpression(_ expression: T) -> some NodeContentConvertible {
        NodeContent.attribute(expression.asAttribute)
    }
    
    public static func buildExpression(_ expression: Set<T>) -> some NodeContentConvertible {
        NodeContent.attributes(Set(expression.map { $0.asAttribute }))
    }
    
    public static func buildFinalResult(_ component: [any NodeContentConvertible]) -> (Set<Attribute>, [Node]) {
        var attributes: Set<Attribute> = []
        var attributeGroup: Set<Attribute> = []
        var nodes = [Node]()
        
        for c in component {
            switch c.asNodeContent {
            case .attribute(let attribute): attributes.insert(attribute)
            case .attributes(let set): attributeGroup.formUnion(set)
            case .child(let node): nodes.append(node)
            }
        }
    
        return (attributes.union(attributeGroup), nodes)
    }
}
