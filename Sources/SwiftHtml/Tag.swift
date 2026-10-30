public struct Tag: TextOutputStreamable {
    let name: String
    let attributes: Set<Attribute>
    let children: [Node]
    let isVoidElement: Bool
    
    public func write<Target>(to target: inout Target) where Target : TextOutputStream {
        target.write("<\(name)")
        
        for attr in attributes.sorted(by: { $0.key < $1.key }) {
            let attr = switch attr {
            case .string(let k, let v): #" \#(k)="\#(v)""#
            case .bool(let k): " \(k)"
            }
            target.write(attr)
        }
        
        guard !isVoidElement else {
            target.write(" />")
            return
        }
        
        target.write(">")
        
        for c in children {
            switch c {
            case .tag(let tag): target.write(String(describing: tag))
            case .string(let string): target.write(string)
            }
        }
        
        target.write("</\(name)>")
    }
}
