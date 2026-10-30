func element(_ name: String, attributes: [any AttributeConvertible], isVoid: Bool, content: () -> (Set<Attribute>, [Node])) -> NodeContent {
    let (attrs, nodes) = content()
    return .child(.tag(Tag(
        name: name,
        attributes: Set(attributes.map { $0.asAttribute }).union(attrs),
        children: nodes,
        isVoidElement: isVoid
    )))
}


public func tag(
    _ name: String,
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element(name, attributes: attributes, isVoid: false, content: content)
}


public func html(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("html", attributes: attributes, isVoid: false, content: content)
}
 

public func base(
    _ attributes: BaseElementAttribute...,
    @NodeContentBuilder<BaseElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("base", attributes: attributes, isVoid: true, content: content)
}
 
public func head(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("head", attributes: attributes, isVoid: false, content: content)
}
 
public func link(
    _ attributes: LinkElementAttribute...,
    @NodeContentBuilder<LinkElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("link", attributes: attributes, isVoid: true, content: content)
}
 
public func meta(
    _ attributes: MetaElementAttribute...,
    @NodeContentBuilder<MetaElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("meta", attributes: attributes, isVoid: true, content: content)
}
 
public func style(
    _ attributes: StyleElementAttribute...,
    @NodeContentBuilder<StyleElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("style", attributes: attributes, isVoid: false, content: content)
}
 
public func title(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("title", attributes: attributes, isVoid: false, content: content)
}
 

public func body(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("body", attributes: attributes, isVoid: false, content: content)
}
 

public func address(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("address", attributes: attributes, isVoid: false, content: content)
}
 
public func article(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("article", attributes: attributes, isVoid: false, content: content)
}
 
public func aside(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("aside", attributes: attributes, isVoid: false, content: content)
}
 
public func footer(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("footer", attributes: attributes, isVoid: false, content: content)
}
 
public func header(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("header", attributes: attributes, isVoid: false, content: content)
}
 
public func h1(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("h1", attributes: attributes, isVoid: false, content: content)
}
 
public func h2(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("h2", attributes: attributes, isVoid: false, content: content)
}
 
public func h3(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("h3", attributes: attributes, isVoid: false, content: content)
}
 
public func h4(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("h4", attributes: attributes, isVoid: false, content: content)
}
 
public func h5(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("h5", attributes: attributes, isVoid: false, content: content)
}
 
public func h6(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("h6", attributes: attributes, isVoid: false, content: content)
}
 
public func hgroup(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("hgroup", attributes: attributes, isVoid: false, content: content)
}
 
public func main(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("main", attributes: attributes, isVoid: false, content: content)
}
 
public func nav(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("nav", attributes: attributes, isVoid: false, content: content)
}
 
public func section(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("section", attributes: attributes, isVoid: false, content: content)
}
 
public func search(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("search", attributes: attributes, isVoid: false, content: content)
}
 

public func blockquote(
    _ attributes: BlockquoteElementAttribute...,
    @NodeContentBuilder<BlockquoteElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("blockquote", attributes: attributes, isVoid: false, content: content)
}
 
public func dd(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("dd", attributes: attributes, isVoid: false, content: content)
}
 
public func div(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("div", attributes: attributes, isVoid: false, content: content)
}
 
public func dl(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("dl", attributes: attributes, isVoid: false, content: content)
}
 
public func dt(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("dt", attributes: attributes, isVoid: false, content: content)
}
 

public func figcaption(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("figcaption", attributes: attributes, isVoid: false, content: content)
}
 
public func figure(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("figure", attributes: attributes, isVoid: false, content: content)
}
 
public func hr(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("hr", attributes: attributes, isVoid: true, content: content)
}
 
public func li(
    _ attributes: LiElementAttribute...,
    @NodeContentBuilder<LiElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("li", attributes: attributes, isVoid: false, content: content)
}
 
public func menu(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("menu", attributes: attributes, isVoid: false, content: content)
}
 
public func ol(
    _ attributes: OlElementAttribute...,
    @NodeContentBuilder<OlElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("ol", attributes: attributes, isVoid: false, content: content)
}
 
public func p(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("p", attributes: attributes, isVoid: false, content: content)
}
 
public func pre(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("pre", attributes: attributes, isVoid: false, content: content)
}
 
public func ul(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("ul", attributes: attributes, isVoid: false, content: content)
}
 

public func a(
    _ attributes: AElementAttribute...,
    @NodeContentBuilder<AElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("a", attributes: attributes, isVoid: false, content: content)
}
 
public func abbr(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("abbr", attributes: attributes, isVoid: false, content: content)
}
 
public func b(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("b", attributes: attributes, isVoid: false, content: content)
}
 
public func bdi(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("bdi", attributes: attributes, isVoid: false, content: content)
}
 
public func bdo(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("bdo", attributes: attributes, isVoid: false, content: content)
}
 
public func br(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("br", attributes: attributes, isVoid: true, content: content)
}
 
public func cite(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("cite", attributes: attributes, isVoid: false, content: content)
}
 
public func code(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("code", attributes: attributes, isVoid: false, content: content)
}
 
public func data(
    _ attributes: DataElementAttribute...,
    @NodeContentBuilder<DataElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("data", attributes: attributes, isVoid: false, content: content)
}
 
public func dfn(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("dfn", attributes: attributes, isVoid: false, content: content)
}
 
public func em(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("em", attributes: attributes, isVoid: false, content: content)
}
 
public func i(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("i", attributes: attributes, isVoid: false, content: content)
}
 
public func kbd(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("kbd", attributes: attributes, isVoid: false, content: content)
}
 
public func mark(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("mark", attributes: attributes, isVoid: false, content: content)
}
 
public func q(
    _ attributes: QElementAttribute...,
    @NodeContentBuilder<QElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("q", attributes: attributes, isVoid: false, content: content)
}
 
public func rp(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("rp", attributes: attributes, isVoid: false, content: content)
}

public func rt(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("rt", attributes: attributes, isVoid: false, content: content)
}
 
public func ruby(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("ruby", attributes: attributes, isVoid: false, content: content)
}
 
public func s(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("s", attributes: attributes, isVoid: false, content: content)
}
 
public func samp(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("samp", attributes: attributes, isVoid: false, content: content)
}
 
public func small(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("small", attributes: attributes, isVoid: false, content: content)
}
 
public func span(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("span", attributes: attributes, isVoid: false, content: content)
}
 
public func strong(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("strong", attributes: attributes, isVoid: false, content: content)
}
 
public func sub(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("sub", attributes: attributes, isVoid: false, content: content)
}
 
public func sup(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("sup", attributes: attributes, isVoid: false, content: content)
}
 
public func time(
    _ attributes: TimeElementAttribute...,
    @NodeContentBuilder<TimeElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("time", attributes: attributes, isVoid: false, content: content)
}
 
public func u(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("u", attributes: attributes, isVoid: false, content: content)
}
 
public func `var`(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("var", attributes: attributes, isVoid: false, content: content)
}

public func wbr(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("wbr", attributes: attributes, isVoid: true, content: content)
}
 

public func area(
    _ attributes: AreaElementAttribute...,
    @NodeContentBuilder<AreaElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("area", attributes: attributes, isVoid: true, content: content)
}
 
public func audio(
    _ attributes: AudioElementAttribute...,
    @NodeContentBuilder<AudioElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("audio", attributes: attributes, isVoid: false, content: content)
}
 
public func img(
    _ attributes: ImgElementAttribute...,
    @NodeContentBuilder<ImgElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("img", attributes: attributes, isVoid: true, content: content)
}
 
public func map(
    _ attributes: MapElementAttribute...,
    @NodeContentBuilder<MapElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("map", attributes: attributes, isVoid: false, content: content)
}
 
public func track(
    _ attributes: TrackElementAttribute...,
    @NodeContentBuilder<TrackElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("track", attributes: attributes, isVoid: true, content: content)
}
 
public func video(
    _ attributes: VideoElementAttribute...,
    @NodeContentBuilder<VideoElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("video", attributes: attributes, isVoid: false, content: content)
}
 

public func embed(
    _ attributes: EmbedElementAttribute...,
    @NodeContentBuilder<EmbedElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("embed", attributes: attributes, isVoid: true, content: content)
}
 
public func iframe(
    _ attributes: IframeEmbedElementAttribute...,
    @NodeContentBuilder<IframeEmbedElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("iframe", attributes: attributes, isVoid: false, content: content)
}
 
public func object(
    _ attributes: ObjectEmbedElementAttribute...,
    @NodeContentBuilder<ObjectEmbedElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("object", attributes: attributes, isVoid: false, content: content)
}
 
public func picture(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("picture", attributes: attributes, isVoid: false, content: content)
}
 
public func source(
    _ attributes: SourceEmbedElementAttribute...,
    @NodeContentBuilder<SourceEmbedElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("source", attributes: attributes, isVoid: true, content: content)
}
 

public func svg(
    _ attributes: SvgElementAttribute...,
    @NodeContentBuilder<SvgElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("svg", attributes: attributes, isVoid: false, content: content)
}
 
public func math(
    _ attributes: MathEmbedElementAttribute...,
    @NodeContentBuilder<MathEmbedElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("math", attributes: attributes, isVoid: false, content: content)
}
 

public func canvas(
    _ attributes: CanvasElementAttribute...,
    @NodeContentBuilder<CanvasElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("canvas", attributes: attributes, isVoid: false, content: content)
}
 
public func noscript(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("noscript", attributes: attributes, isVoid: false, content: content)
}
 
public func script(
    _ attributes: ScriptElementAttribute...,
    @NodeContentBuilder<ScriptElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("script", attributes: attributes, isVoid: false, content: content)
}
 

public func del(
    _ attributes: DelElementAttribute...,
    @NodeContentBuilder<DelElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("del", attributes: attributes, isVoid: false, content: content)
}
 
public func ins(
    _ attributes: InsElementAttribute...,
    @NodeContentBuilder<InsElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("ins", attributes: attributes, isVoid: false, content: content)
}
 

public func caption(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("caption", attributes: attributes, isVoid: false, content: content)
}
 
public func col(
    _ attributes: ColElementAttribute...,
    @NodeContentBuilder<ColElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("col", attributes: attributes, isVoid: true, content: content)
}
 
public func colgroup(
    _ attributes: ColgroupElementAttribute...,
    @NodeContentBuilder<ColgroupElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("colgroup", attributes: attributes, isVoid: false, content: content)
}
 
public func table(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("table", attributes: attributes, isVoid: false, content: content)
}
 
public func tbody(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("tbody", attributes: attributes, isVoid: false, content: content)
}
 
public func td(
    _ attributes: TdElementAttribute...,
    @NodeContentBuilder<TdElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("td", attributes: attributes, isVoid: false, content: content)
}
 
public func tfoot(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("tfoot", attributes: attributes, isVoid: false, content: content)
}
 
public func th(
    _ attributes: ThElementAttribute...,
    @NodeContentBuilder<ThElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("th", attributes: attributes, isVoid: false, content: content)
}
 
public func thead(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("thead", attributes: attributes, isVoid: false, content: content)
}
 
public func tr(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("tr", attributes: attributes, isVoid: false, content: content)
}
 

public func button(
    _ attributes: ButtonElementAttribute...,
    @NodeContentBuilder<ButtonElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("button", attributes: attributes, isVoid: false, content: content)
}
 
public func datalist(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("datalist", attributes: attributes, isVoid: false, content: content)
}
 
public func fieldset(
    _ attributes: FieldsetElementAttribute...,
    @NodeContentBuilder<FieldsetElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("fieldset", attributes: attributes, isVoid: false, content: content)
}
 
public func form(
    _ attributes: FormElementAttribute...,
    @NodeContentBuilder<FormElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("form", attributes: attributes, isVoid: false, content: content)
}
 
public func input(
    _ attributes: InputElementAttribute...,
    @NodeContentBuilder<InputElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("input", attributes: attributes, isVoid: true, content: content)
}
 
public func label(
    _ attributes: LabelElementAttribute...,
    @NodeContentBuilder<LabelElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("label", attributes: attributes, isVoid: false, content: content)
}
 
public func legend(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("legend", attributes: attributes, isVoid: false, content: content)
}
 
public func meter(
    _ attributes: MeterElementAttribute...,
    @NodeContentBuilder<MeterElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("meter", attributes: attributes, isVoid: false, content: content)
}
 
public func optgroup(
    _ attributes: OptgroupElementAttribute...,
    @NodeContentBuilder<OptgroupElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("optgroup", attributes: attributes, isVoid: false, content: content)
}
 
public func option(
    _ attributes: OptionElementAttribute...,
    @NodeContentBuilder<OptionElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("option", attributes: attributes, isVoid: false, content: content)
}
 
public func output(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("output", attributes: attributes, isVoid: false, content: content)
}
 
public func progress(
    _ attributes: ProgressElementAttribute...,
    @NodeContentBuilder<ProgressElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("progress", attributes: attributes, isVoid: false, content: content)
}
 
public func select(
    _ attributes: SelectElementAttribute...,
    @NodeContentBuilder<SelectElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("select", attributes: attributes, isVoid: false, content: content)
}
 
public func selectedcontent(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("selectedcontent", attributes: attributes, isVoid: false, content: content)
}
 
public func textarea(
    _ attributes: TextareaElementAttribute...,
    @NodeContentBuilder<TextareaElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("textarea", attributes: attributes, isVoid: false, content: content)
}
 

public func details(
    _ attributes: DetailsElementAttribute...,
    @NodeContentBuilder<DetailsElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("details", attributes: attributes, isVoid: false, content: content)
}
 
public func dialog(
    _ attributes: DialogElementAttribute...,
    @NodeContentBuilder<DialogElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("dialog", attributes: attributes, isVoid: false, content: content)
}
 
public func geolocation(
    _ attributes: GeolocationElementAttribute...,
    @NodeContentBuilder<GeolocationElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("geolocation", attributes: attributes, isVoid: false, content: content)
}
 
public func summary(
    _ attributes: GlobalElementAttribute...,
    @NodeContentBuilder<GlobalElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("summary", attributes: attributes, isVoid: false, content: content)
}
 

public func slot(
    _ attributes: SlotElementAttribute...,
    @NodeContentBuilder<SlotElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("slot", attributes: attributes, isVoid: false, content: content)
}
 
public func template(
    _ attributes: TemplateElementAttribute...,
    @NodeContentBuilder<TemplateElementAttribute> content: (() -> (Set<Attribute>, [Node])) = {([], [])}
) -> NodeContent {
    element("template", attributes: attributes, isVoid: false, content: content)
}
