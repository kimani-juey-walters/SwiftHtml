import Testing
import Foundation
@testable import SwiftHtml

@Test func testExample() async throws {
    let examples = [
        (
            html(.lang("en")) {
                head {
                    meta(.charset("utf-8"))
                    title { "Example Html" }
                    style {
                        """
                        p { background-color: blue; }
                        """
                    }
                }
                body {
                    div(.class("wrapper")) {
                        section {
                            h2 {
                                span { "#" }
                                "A Section Title"
                            }
                            p { "Some example text." }
                        }
                        a(.href("https://example.com/")) { "example site" }
                    }
                }
            },
            """
            <!DOCTYPE html>
            <html lang="en">
                <head>
                    <meta charset="utf-8" />
                    <title>Example Html</title>
                    <style>p { background-color: blue; }</style>
                </head>
                <body>
                    <div class="wrapper">
                        <section>
                            <h2><span>#</span>A Section Title</h2>
                            <p>Some example text.</p>
                        </section>
                        <a href="https://example.com/">example site</a>
                    </div>
                </body>
            </html>
            """
        ),
        (
            html {
                .lang("en");
                
                head {
                    meta { .charset("utf-8"); }
                    title { "Example Html" }
                    style {
                        """
                        p { background-color: blue; }
                        """
                    }
                }
                body {
                    div {
                        [.attr("class", "wrapper")]
                        
                        section {
                            h2 {
                                span { "#" }
                                "A Section Title"
                            }
                            p { "Some example text." }
                        }
                        a { .href("https://example.com/"); "example site" }
                    }
                }
            },
            """
            <!DOCTYPE html>
            <html lang="en">
                <head>
                    <meta charset="utf-8" />
                    <title>Example Html</title>
                    <style>p { background-color: blue; }</style>
                </head>
                <body>
                    <div class="wrapper">
                        <section>
                            <h2><span>#</span>A Section Title</h2>
                            <p>Some example text.</p>
                        </section>
                        <a href="https://example.com/">example site</a>
                    </div>
                </body>
            </html>
            """
        ),
        (
            html {
                .lang("en");
                
                head {
                    meta(.charset("utf-8"))
                    title { "Example Html" }
                    style {
                        """
                        p { background-color: blue; }
                        """
                    }
                    link(.rel("preconnect"), .href("https://site.com/page"), .crossorigin)
                    script(.src("index.js"))
                }
                body {
                    div {
                        .class("wrapper");
                        
                        section {
                            .id("about");
                            .class("about");
                            
                            h2 {
                                span { "##" }
                                "About Section"
                            }
                            p { "The about section." }
                        }
                        section {
                            [.id("rules"), .class("rules")]
                            
                            h2 {
                                span { "##" }
                                "Rules Section"
                            }
                            p { "The rules section." }
                        }
                        a { .href("https://example.com/"); "Home page" }
                        a(.href("https://example.com/about")) { "About page" }
                    }
                }
            },
            """
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
                            <h2><span>##</span>About Section</h2>
                            <p>The about section.</p>
                        </section>
                        <section class="rules" id="rules">
                            <h2><span>##</span>Rules Section</h2>
                            <p>The rules section.</p>
                        </section>
                        <a href="https://example.com/">Home page</a>
                        <a href="https://example.com/about">About page</a>
                    </div>
                </body>
            </html>
            """
        )
    ]
    
    for (result, expected) in examples {
        let a = String(describing: result)
        let b = expected.split(separator: "\n").map{ $0.trimmingCharacters(in: .whitespaces) }.joined()
        #expect(a == b)
    }
}
