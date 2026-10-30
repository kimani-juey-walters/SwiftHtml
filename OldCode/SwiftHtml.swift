import HtmlMacros


public protocol HTML: Sendable {
    func toHTML() -> String
}

extension String: HtmlAttribute {
    public var value: HtmlAttributeValue { .string(self) }
}

extension Bool: HtmlAttribute {
    public var value: HtmlAttributeValue { .bool(self) }
}


extension String: HTML {
    public func toHTML() -> String { self }
}


public struct HTMLNode: Sendable, HTML {
    let tag: String
    let attributes: [String: HtmlAttributeValue]
    let children: [any HTML]
    let isVoidElement: Bool
    
    
    public func toHTML() -> String {
        var s = "<\(tag)"
        for (k, v) in attributes {
            let attr = switch v {
            case .string(let s):  #" \#(k)="\#(s)""#
            case .bool(true): " \(k)"
            case .bool(false): ""
            }
            s += attr
        }
        
        guard !isVoidElement else {
            s += " />"
            return s
        }
        
        s += ">"
        
        for c in children {
            s += c.toHTML()
        }
        
        s += "</\(tag)>"
        return s
    }
}


@resultBuilder
public struct HTMLBuilder {
    public static func buildBlock(_ nodes: any HTML...) -> [any HTML] {
        nodes
    }
}

@HtmlTag
public struct GenericTag: Sendable {}

@HtmlTag(isVoid: true)
public struct GenericVoidTag: Sendable {}

// TODO: Replace with either generic or specialized Tag class
public typealias PlaceholderTag = GenericTag
public typealias PlaceholderVoidTag = GenericVoidTag


@HtmlTag(attributes: [.string("href"), .string("target")], isVoid: true)
public struct BaseTag: Sendable {}

@HtmlTag(attributes: [
    .string("as"),
    .string("blocking"),
    .string("target"),
    .string("crossorigin"),
    .bool("disabled"),
    .string("fetchpriority"),
    .string("href"),
    .string("hreflang"),
    .string("imagesizes"),
    .string("imagesrcset"),
    .string("integrity"),
    .string("media"),
    .string("referrerpolicy"),
    .string("rel"),
    .string("sizes"),
    .string("title"),
    .string("type"),
], isVoid: true)
public struct LinkTag: Sendable {}

@HtmlTag(attributes: [
    .string("charset"),
    .string("content"),
//  .string("http-equiv"), use otherAttrs for attributes with dash
    .string("media"),
    .string("name"),
], isVoid: true)
public struct MetaTag: Sendable {}

@HtmlTag(attributes: [
    .string("blocking"),
    .string("nonce"),
    .string("media"),
    .string("title"),
], type: .styleElement)
public struct StyleTag: Sendable {}

@HtmlTag(attributes: [.string("cite")])
public struct BlockquoteTag: Sendable {}

@HtmlTag(attributes: [.string("value")])
public struct LiTag: Sendable {}

@HtmlTag(attributes: [.bool("reversed"), .string("start"), .string("type")])
public struct OlTag: Sendable {}

@HtmlTag(attributes: [
    .string("command"),
    .string("commandfor"),
    .bool("disabled"),
    .string("form"),
    .string("formaction"),
    .string("formenctype"),
    .string("formmethod"),
    .bool("formnovalidate"),
    .string("formtarget"),
    .string("interestfor"),
    .string("name"),
    .string("popovertarget"),
    .string("popovertargetaction"),
    .string("type"),
    .string("value"),
])
public struct ButtonTag: Sendable {}

@HtmlTag(attributes: [.bool("disabled"), .string("form"), .string("name")])
public struct FieldsetTag: Sendable {}

@HtmlTag(attributes: [
//  .string("accept-charset"), use otherAttrs for attributes with dash
    .string("autocomplete"),
    .string("name"),
    .string("rel"),
    .string("action"),
    .string("enctype"),
    .string("method"),
    .bool("novalidate"),
    .string("target"),
])
public struct FormTag: Sendable {}


@HtmlTag(attributes: [.string("for")])
public struct LabelTag: Sendable {}

@HtmlTag(attributes: [
    .string("value"),
    .string("min"),
    .string("max"),
    .string("low"),
    .string("high"),
    .string("optimum"),
])
public struct MeterTag: Sendable {}

@HtmlTag(attributes: [.bool("disabled"), .string("label")])
public struct OptgroupTag: Sendable {}

@HtmlTag(attributes: [.bool("disabled"), .string("label"), .bool("selected"), .string("value")])
public struct OptionTag: Sendable {}

@HtmlTag(attributes: [.string("for"), .string("form"), .string("name")])
public struct OutputTag: Sendable {}

@HtmlTag(attributes: [.string("max"), .string("value")])
public struct ProgressTag: Sendable {}

@HtmlTag(attributes: [
    .string("autocomplete"),
    .bool("disabled"),
    .string("form"),
    .bool("multiple"),
    .string("name"),
    .bool("required"),
    .string("size"),
])
public struct SelectTag: Sendable {}

@HtmlTag(attributes: [
    .string("autocomplete"),
    .string("autocorrect"),
    .string("cols"),
    .string("dirname"),
    .bool("disabled"),
    .string("form"),
    .string("maxlength"),
    .string("minlength"),
    .string("name"),
    .string("placeholder"),
    .bool("readonly"),
    .bool("required"),
    .string("rows"),
    .string("spellcheck"),
    .string("wrap"),
])
public struct TextareaTag: Sendable {}


@HtmlTag(attributes: [.bool("open"), .string("name")])
public struct DetailsTag: Sendable {}

@HtmlTag(attributes: [.string("closedby"), .bool("open")])
public struct DialogTag: Sendable {}

@HtmlTag(attributes: [.bool("autolocate"), .bool("watch")])
public struct GeolocationTag: Sendable {}

@HtmlTag(attributes: [.string("name")])
public struct SlotTag: Sendable {}

@HtmlTag(attributes: [
    .string("for"),
    .string("shadowrootmode"),
    .bool("shadowrootclonable"),
    .bool("shadowrootcustomelementregistry"),
    .bool("shadowrootdelegatesfocus"),
    .string("shadowrootreferencetarget"),
    .bool("shadowrootserializable"),
    .string("shadowrootslotassignment"),
])
public struct TemplateTag: Sendable {}

public let html = GenericTag(tag: "html")

public let base = BaseTag()
public let head = GenericTag(tag: "head")
public let link = LinkTag()
public let meta = MetaTag()
public let style = StyleTag()
public let title = GenericTag(tag: "title")

public let body = GenericTag(tag: "body")

public let address = GenericTag(tag: "address")
public let article = GenericTag(tag: "article")
public let aside = GenericTag(tag: "aside")
public let footer = GenericTag(tag: "footer")
public let header = GenericTag(tag: "header")
public let h1 = GenericTag(tag: "h1")
public let h2 = GenericTag(tag: "h2")
public let h3 = GenericTag(tag: "h3")
public let h4 = GenericTag(tag: "h4")
public let h5 = GenericTag(tag: "h5")
public let h6 = GenericTag(tag: "h6")
public let hgroup = GenericTag(tag: "hgroup")
public let main = GenericTag(tag: "main")
public let nav = GenericTag(tag: "nav")
public let section = GenericTag(tag: "section")
public let search = GenericTag(tag: "search")

public let blockquote = BlockquoteTag()
public let dd = GenericTag(tag: "dd")
public let div = GenericTag(tag: "div")
public let dl = GenericTag(tag: "dl")
public let dt = GenericTag(tag: "dt")
public let figcaption = GenericTag(tag: "figcaption")
public let figure = GenericTag(tag: "figure")
public let hr = GenericVoidTag(tag: "hr")
public let li = LiTag()
public let menu = GenericTag(tag: "menu")
public let ol = OlTag()
public let p = GenericTag(tag: "p")
public let pre = GenericTag(tag: "pre")
public let ul = GenericTag(tag: "ul")

public let a = PlaceholderTag(tag: "a")
public let abbr = PlaceholderTag(tag: "abbr")
public let b = PlaceholderTag(tag: "b")
public let bdi = PlaceholderTag(tag: "bdi")
public let bdo = PlaceholderTag(tag: "bdo")
public let br = PlaceholderVoidTag(tag: "br")
public let cite = PlaceholderTag(tag: "cite")
public let code = PlaceholderTag(tag: "code")
public let data = PlaceholderTag(tag: "data")
public let dfn = PlaceholderTag(tag: "dfn")
public let em = PlaceholderTag(tag: "em")
public let i = PlaceholderTag(tag: "i")
public let kbd = PlaceholderTag(tag: "kbd")
public let mark = PlaceholderTag(tag: "mark")
public let q = PlaceholderTag(tag: "q")
public let rt = PlaceholderTag(tag: "rt")
public let ruby = PlaceholderTag(tag: "ruby")
public let s = PlaceholderTag(tag: "s")
public let samp = PlaceholderTag(tag: "samp")
public let small = PlaceholderTag(tag: "small")
public let span = PlaceholderTag(tag: "span")
public let strong = PlaceholderTag(tag: "strong")
public let sub = PlaceholderTag(tag: "sub")
public let sup = PlaceholderTag(tag: "sup")
public let time = PlaceholderTag(tag: "time")
public let u = PlaceholderTag(tag: "u")
public let `var` = PlaceholderTag(tag: "var")
public let wbr = PlaceholderVoidTag(tag: "wbr")

public let area = PlaceholderVoidTag(tag: "area")
public let audio = PlaceholderTag(tag: "audio")
public let img = PlaceholderVoidTag(tag: "img")
public let map = PlaceholderTag(tag: "map")
public let track = PlaceholderVoidTag(tag: "track")
public let video = PlaceholderTag(tag: "video")

public let embed = PlaceholderVoidTag(tag: "embed")
public let iframe = PlaceholderTag(tag: "iframe")
public let object = PlaceholderTag(tag: "object")
public let picture = PlaceholderTag(tag: "picture")
public let source = PlaceholderVoidTag(tag: "source")

public let svg = PlaceholderTag(tag: "svg")
public let math = PlaceholderTag(tag: "math")

public let canvas = PlaceholderTag(tag: "canvas")
public let noscript = PlaceholderTag(tag: "noscript")
public let script = PlaceholderTag(tag: "script")

public let del = PlaceholderTag(tag: "del")
public let ins = PlaceholderTag(tag: "ins")

public let caption = PlaceholderTag(tag: "caption")
public let col = PlaceholderVoidTag(tag: "col")
public let colgroup = PlaceholderTag(tag: "colgroup")
public let table = PlaceholderTag(tag: "table")
public let tbody = PlaceholderTag(tag: "tbody")
public let td = PlaceholderTag(tag: "td")
public let tfoot = PlaceholderTag(tag: "tfoot")
public let th = PlaceholderTag(tag: "th")
public let thead = PlaceholderTag(tag: "thead")
public let tr = PlaceholderTag(tag: "tr")

public let button = ButtonTag()
public let datalist = GenericTag(tag: "datalist")
public let fieldset = FieldsetTag()
public let form = FormTag()
public let input = PlaceholderVoidTag(tag: "input")
public let label = LabelTag()
public let legend = GenericTag(tag: "legend")
public let meter = MeterTag()
public let optgroup = OptgroupTag()
public let option = OptionTag()
public let output = OutputTag()
public let progress = ProgressTag()
public let select = SelectTag()
public let selectedcontent = GenericTag(tag: "selectedcontent")
public let textarea = TextareaTag()

public let details = DetailsTag()
public let dialog = DialogTag()
public let geolocation = GeolocationTag()
public let summary = GenericTag(tag: "summary")

public let slot = SlotTag()
public let template = TemplateTag()
