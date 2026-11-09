// swift-tools-version: 6.4

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "swift-html",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "SwiftHtml", targets: ["SwiftHtml"])
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "604.0.0-latest"),
    ],
    targets: [
        .macro(name: "HtmlElementAttributeMacro", dependencies: ["GlobalAttributes", "Utils"]),
        .macro(name: "EnumCaseDescriptionMacro", dependencies: ["Utils"]),
        .target(name: "HtmlElementAttribute", dependencies: ["HtmlElementAttributeMacro"]),
        .target(name: "EnumCaseDescription", dependencies: ["EnumCaseDescriptionMacro"]),
        
        .target(name: "GlobalAttributes", dependencies: ["EnumCaseDescription"]),
        .target(name: "SwiftHtml", dependencies: ["HtmlElementAttribute"]),
        .target(name: "Utils", dependencies: [.product(name: "SwiftSyntaxMacros", package: "swift-syntax")]),

        .testTarget(name: "SwiftHtmlTests", dependencies: ["SwiftHtml"]),
        .testTarget(
            name: "MacroTests",
            dependencies: [
                "EnumCaseDescriptionMacro",
                "HtmlElementAttributeMacro",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ],
        ),
    ]
)

let macroTargets = package.targets.filter({ if case .macro = $0.type {true} else {false} })
let regularTargets = package.targets.filter({ if case .regular = $0.type {true} else {false} })
let testTargets = package.targets.filter({ if case .test = $0.type {true} else {false} })

for target in regularTargets + testTargets {
    var settings = target.swiftSettings ?? []
    settings.append(contentsOf: [.enableUpcomingFeature("ApproachableConcurrency")])
    target.swiftSettings = settings
}

for target in macroTargets {
    target.dependencies.append(contentsOf: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
    ])
}
