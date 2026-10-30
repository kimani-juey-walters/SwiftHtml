public struct Tag: TextOutputStreamable {
    let name: String
    let attributes: Set<Attribute>
    let children: [Node]
    let isVoidElement: Bool
   
    public func write(to target: inout some TextOutputStream) {
        write(to: &target, dept: 0)
    }
    
    func write(to target: inout some TextOutputStream, dept: Int) {
        target.write("<\(name)", dept: dept)

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
        
        if children.count == 0 {
            target.write("</\(name)>")
        } else if children.count == 1, case .string(let string) = children.first {
            target.write(string)
            target.write("</\(name)>")
        } else {
            target.write("\n")
            
            for c in children {
                switch c {
                case .tag(let tag): tag.write(to: &target, dept: dept + 1)
                case .string(let string): target.write(string, dept: dept + 1)
                }
                target.write("\n")
            }
            target.write("</\(name)>", dept: dept)
        }
    }
}


extension TextOutputStream {
    mutating func write(_ v: String, dept: Int) {
        let indentation = String(repeating: " ", count: 4 * dept)
        write(indentation + v)
    }
}
