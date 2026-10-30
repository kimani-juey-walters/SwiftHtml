@_exported import HtmlAttributes


@attached(member, names: named(tag), named(isVoidElement), named(init), named(callAsFunction))
public macro HtmlTag(
    attributes: [HtmlAttributeType] = [],
    isVoid: Bool = false,
    type: HtmlTagMacroType = .element
) = #externalMacro(module: "MacroImplementations", type: "HtmlTagMacro")


