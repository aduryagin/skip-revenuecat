// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "skip-revenuecat-app",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipRevenueCatAppApp", type: .dynamic, targets: ["SkipRevenueCatApp"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.1.7"),
        .package(url: "https://source.skip.tools/skip-ui.git", from: "1.0.0"),
        .package(name: "skip-revenuecat", path: "../skip-revenuecat")
    ],
    targets: [
        .target(
            name: "SkipRevenueCatApp",
            dependencies: [
                .product(name: "SkipUI", package: "skip-ui"),
                .product(name: "SkipRevenueCat", package: "skip-revenuecat")
            ],
            resources: [.process("Resources")],
            plugins: [.plugin(name: "skipstone", package: "skip")]
        ),
        .testTarget(name: "SkipRevenueCatAppTests", dependencies: ["SkipRevenueCatApp", .product(name: "SkipTest", package: "skip")], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
