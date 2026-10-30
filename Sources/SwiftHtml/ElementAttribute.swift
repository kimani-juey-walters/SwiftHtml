import HtmlElementAttribute


public typealias PlaceholderElementAttribute = GlobalElementAttribute


@HTMLElementAttribute
public enum GlobalElementAttribute: Sendable, AttributeConvertible, Hashable {}


@HTMLElementAttribute
public enum BaseElementAttribute: Sendable, AttributeConvertible, Hashable {
    case href(String)
    case target(String)
}


@HTMLElementAttribute
public enum LinkElementAttribute: Sendable, AttributeConvertible, Hashable {
    public static let crossorigin: Self = .crossorigin(nil)
    
    case `as`(String)
    case blocking(String)
    case target(String)
    case crossorigin(String?)
    case disabled
    case fetchpriority(String)
    case href(String)
    case hreflang(String)
    case imagesizes(String)
    case imagesrcset(String)
    case integrity(String)
    case media(String)
    case referrerpolicy(String)
    case rel(String)
    case sizes(String)
    case type(String)
}


@HTMLElementAttribute
public enum MetaElementAttribute: Sendable, AttributeConvertible, Hashable {
    case charset(String)
    case content(String)
    case httpEquiv(String)
    case media(String)
    case name(String)
}


@HTMLElementAttribute
public enum StyleElementAttribute: Sendable, AttributeConvertible, Hashable {
    case blocking(String)
    case media(String)
}


@HTMLElementAttribute
public enum BlockquoteElementAttribute: Sendable, AttributeConvertible, Hashable {
    case cite(String)
}


@HTMLElementAttribute
public enum LiElementAttribute: Sendable, AttributeConvertible, Hashable {
    case value(String)
}


@HTMLElementAttribute
public enum OlElementAttribute: Sendable, AttributeConvertible, Hashable {
    case reversed
    case start(String)
    case type(String)
}

@HTMLElementAttribute
public enum ButtonElementAttribute: Sendable, AttributeConvertible, Hashable {
    case command(String)
    case commandfor(String)
    case disabled
    case form(String)
    case formaction(String)
    case formenctype(String)
    case formmethod(String)
    case formnovalidate
    case formtarget(String)
    case interestfor(String)
    case name(String)
    case popovertarget(String)
    case popovertargetaction(String)
    case type(String)
    case value(String)
}


@HTMLElementAttribute
public enum FieldsetElementAttribute: Sendable, AttributeConvertible, Hashable {
    case disabled
    case form(String)
    case name(String)
}


@HTMLElementAttribute
public enum FormElementAttribute: Sendable, AttributeConvertible, Hashable {
    case acceptCharset(String)
    case autocomplete(String)
    case name(String)
    case rel(String)
    case action(String)
    case enctype(String)
    case method(String)
    case novalidate
    case target(String)
}

@HTMLElementAttribute
public enum InputElementAttribute: Sendable, AttributeConvertible, Hashable {
    case accept(String)
    case alt(String)
    case autocomplete(String)
    case capture(String)
    case checked
    case dirname(String)
    case disabled
    case form(String)
    case formaction(String)
    case formenctype(String)
    case formmethod(String)
    case formnovalidate
    case formtarget(String)
    case height(String)
    case list(String)
    case max(String)
    case maxlength(String)
    case min(String)
    case minlength(String)
    case multiple
    case name(String)
    case pattern(String)
    case placeholder(String)
    case popovertarget(String)
    case popovertargetaction(String)
    case readonly
    case required
    case size(String)
    case src(String)
    case step(String)
    case type(String)
    case value(String)
    case webkitdirectory(String)
    case width(String)
}


@HTMLElementAttribute
public enum LabelElementAttribute: Sendable, AttributeConvertible, Hashable {
    case `for`(String)
}


@HTMLElementAttribute
public enum MeterElementAttribute: Sendable, AttributeConvertible, Hashable {
    case value(String)
    case min(String)
    case max(String)
    case low(String)
    case high(String)
    case optimum(String)
}


@HTMLElementAttribute
public enum OptgroupElementAttribute: Sendable, AttributeConvertible, Hashable {
    case disabled
    case label(String)
}


@HTMLElementAttribute
public enum OptionElementAttribute: Sendable, AttributeConvertible, Hashable {
    case disabled
    case label(String)
    case selected
    case value(String)
}


@HTMLElementAttribute
public enum OuputElementAttribute: Sendable, AttributeConvertible, Hashable {
    case `for`(String)
    case form(String)
    case name(String)
}


@HTMLElementAttribute
public enum ProgressElementAttribute: Sendable, AttributeConvertible, Hashable {
    case max(String)
    case value(String)
}


@HTMLElementAttribute
public enum SelectElementAttribute: Sendable, AttributeConvertible, Hashable {
    case autocomplete(String)
    case disabled
    case form(String)
    case multiple
    case name(String)
    case required
    case size(String)
}


@HTMLElementAttribute
public enum TextareaElementAttribute: Sendable, AttributeConvertible, Hashable {
    case autocomplete(String)
    case cols(String)
    case dirname(String)
    case disabled
    case form(String)
    case maxlength(String)
    case minlength(String)
    case name(String)
    case placeholder(String)
    case readonly
    case required
    case rows(String)
    case wrap(String)

}


@HTMLElementAttribute
public enum DetailsElementAttribute: Sendable, AttributeConvertible, Hashable {
    case open
    case name(String)
}


@HTMLElementAttribute
public enum DialogElementAttribute: Sendable, AttributeConvertible, Hashable {
    case closedby(String)
    case open
}


@HTMLElementAttribute
public enum GeolocationElementAttribute: Sendable, AttributeConvertible, Hashable {
    case autolocate
    case watch
}


@HTMLElementAttribute
public enum SlotElementAttribute: Sendable, AttributeConvertible, Hashable {
    case name(String)
}


@HTMLElementAttribute
public enum TemplateElementAttribute: Sendable, AttributeConvertible, Hashable {
    case `for`(String)
    case shadowrootmode(String)
    case shadowrootclonable
    case shadowrootcustomelementregistry
    case shadowrootdelegatesfocus
    case shadowrootreferencetarget(String)
    case shadowrootserializable
    case shadowrootslotassignment(String)
}


@HTMLElementAttribute
public enum AElementAttribute: Sendable, AttributeConvertible, Hashable {
    public static let download: Self = .download(nil)

    case download(String?)
    case href(String)
    case hreflang(String)
    case ping(String)
    case referrerpolicy(String)
    case rel(String)
    case target(String)
    case type(String)
}


@HTMLElementAttribute
public enum DataElementAttribute: Sendable, AttributeConvertible, Hashable {
    case value(String)
}


@HTMLElementAttribute
public enum QElementAttribute: Sendable, AttributeConvertible, Hashable {
    case cite(String)
}


@HTMLElementAttribute
public enum TimeElementAttribute: Sendable, AttributeConvertible, Hashable {
    case datetime(String)
}

@HTMLElementAttribute
public enum AreaElementAttribute: Sendable, AttributeConvertible, Hashable {
    public static let download: Self = .download(nil)

    case alt(String)
    case coords(String)
    case download(String?)
    case href(String)
    case ping(String)
    case referrerpolicy(String)
    case rel(String)
    case shape(String)
    case target(String)
}


@HTMLElementAttribute
public enum AudioElementAttribute: Sendable, AttributeConvertible, Hashable {
    public static let crossorigin: Self = .crossorigin(nil)
    
    case autoplay
    case controls
    case controlslist(String)
    case crossorigin(String?)
    case disableremoteplayback
    case loop
    case muted
    case preload(String)
    case src(String)
}


@HTMLElementAttribute
public enum ImgElementAttribute: Sendable, AttributeConvertible, Hashable {
    public static let crossorigin: Self = .crossorigin(nil)
    
    case alt(String)
    case crossorigin(String?)
    case decoding(String)
    case elementtiming(String)
    case fetchpriority(String)
    case height(String)
    case ismap
    case loading(String)
    case referrerpolicy(String)
    case sizes(String)
    case src(String)
    case srcset(String)
    case width(String)
    case usemap(String)
}


@HTMLElementAttribute
public enum MapElementAttribute: Sendable, AttributeConvertible, Hashable {
    case name(String)
}

@HTMLElementAttribute
public enum TrackElementAttribute: Sendable, AttributeConvertible, Hashable {
    case `default`
    case kind(String)
    case label(String)
    case src(String)
    case srclang(String)
}

@HTMLElementAttribute
public enum VideoElementAttribute: Sendable, AttributeConvertible, Hashable {
    public static let crossorigin: Self = .crossorigin(nil)
    
    case autoplay
    case controls
    case controlslist(String)
    case crossorigin(String?)
    case disablepictureinpicture
    case disableremoteplayback
    case height(String)
    case loading(String)
    case loop
    case muted
    case playsinline
    case poster(String)
    case preload(String)
    case src(String)
    case width(String)
}

@HTMLElementAttribute
public enum EmbedElementAttribute: Sendable, AttributeConvertible, Hashable {
    case height(String)
    case src(String)
    case type(String)
    case width(String)
}


@HTMLElementAttribute
public enum IframeEmbedElementAttribute: Sendable, AttributeConvertible, Hashable {
    case allow(String)
    case height(String)
    case loading(String)
    case name(String)
    case referrerpolicy(String)
    case sandbox(String)
    case src(String)
    case srcdoc(String)
    case width(String)
}

@HTMLElementAttribute
public enum ObjectEmbedElementAttribute: Sendable, AttributeConvertible, Hashable {
    case data(String)
    case form(String)
    case height(String)
    case name(String)
    case type(String)
    case width(String)
}

@HTMLElementAttribute
public enum SourceEmbedElementAttribute: Sendable, AttributeConvertible, Hashable {
    case type(String)
    case src(String)
    case srcset(String)
    case sizes(String)
    case media(String)
    case height(String)
    case width(String)
}

@HTMLElementAttribute
public enum SvgElementAttribute: Sendable, AttributeConvertible, Hashable {
    // TODO: Add additional svg attributes and permited elements. Do the same for similar elements.
}


@HTMLElementAttribute
public enum MathEmbedElementAttribute: Sendable, AttributeConvertible, Hashable {
    // TODO: Add additional svg attributes and permited elements. Do the same for similar elements.
}

@HTMLElementAttribute
public enum CanvasElementAttribute: Sendable, AttributeConvertible, Hashable {
    case height(String)
    case width(String)
}

@HTMLElementAttribute
public enum ScriptElementAttribute: Sendable, AttributeConvertible, Hashable {
    public static let crossorigin: Self = .crossorigin(nil)
    
    case async
    case blocking(String)
    case crossorigin(String?)
    case `defer`
    case fetchpriority(String)
    case integrity(String)
    case nomodule
    case referrerpolicy(String)
    case src(String)
    case type(String)

}

@HTMLElementAttribute
public enum DelElementAttribute: Sendable, AttributeConvertible, Hashable {
    case cite(String)
    case datetime(String)
}

@HTMLElementAttribute
public enum InsElementAttribute: Sendable, AttributeConvertible, Hashable {
    case cite(String)
    case datetime(String)
}

@HTMLElementAttribute
public enum ColElementAttribute: Sendable, AttributeConvertible, Hashable {
    case span(String)
}

@HTMLElementAttribute
public enum ColgroupElementAttribute: Sendable, AttributeConvertible, Hashable {
    case span(String)
}

@HTMLElementAttribute
public enum TdElementAttribute: Sendable, AttributeConvertible, Hashable {
    case colspan(String)
    case headers(String)
    case rowspan(String)
}

@HTMLElementAttribute
public enum ThElementAttribute: Sendable, AttributeConvertible, Hashable {
    case abbr(String)
    case colspan(String)
    case headers(String)
    case rowspan(String)
    case scope(String)
}
