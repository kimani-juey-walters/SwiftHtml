# swift-html
An experimental Swift DSL for HTML that offers a few variations for adding attributes as seen below.

```swift
import SwiftHtml

let result = html(.lang("en")) {
    head {
        meta(.charset("utf-8"))
        title <| "Example Html"
        
        """
        p { background-color: blue; }
        """
        |> style
        
        link(.rel("preconnect"), .href("https://site.com/page"), .crossorigin)
        script(.src("index.js"))
    }
    
    body <| div(.class("wrapper")) {
        section {
            [.id("about"), .class("about")]
            
            h2 {
                "##" |> span
                "About Section"
            }
            "The about section." |> p
        }
        section {
            .id("rules");
            .class("rules");
            
            h2 {
                span <| "##"
                "Rules Section"
            }
            p <| "The rules section."
        }
        "Home page" |> a(.href("https://example.com/"))
        a(.href("https://example.com/about")) <| "About page"
    }
}

print(result)
```

Produces the following result

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Example Html</title>
        <style>p { background-color: blue; }</style>
        <link crossorigin href="https://site.com/page" rel="preconnect" />
        <script src="index.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <section class="about" id="about">
                <h2>
                    <span>##</span>
                    About Section
                </h2>
                <p>The about section.</p>
            </section>
            <section class="rules" id="rules">
                <h2>
                    <span>##</span>
                    Rules Section
                </h2>
                <p>The rules section.</p>
            </section>
            <a href="https://example.com/">Home page</a>
            <a href="https://example.com/about">About page</a>
        </div>
    </body>
</html>
```
