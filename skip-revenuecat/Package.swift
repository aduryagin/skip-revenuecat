// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "skip-revenuecat",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(name: "SkipRevenueCat", targets: [
            "SkipRevenueCat",
            "SkipRevenueCatLibrary"
        ]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.1.6"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "1.0.0"),
        .package(url: "https://github.com/RevenueCat/purchases-hybrid-common.git", exact: "13.3.0")
    ],
    targets: [
        .target(
            name: "SkipRevenueCat",
            dependencies: [
                .product(name: "SkipFoundation", package: "skip-foundation"),
                .product(name: "PurchasesHybridCommon", package: "purchases-hybrid-common"),
                .product(name: "PurchasesHybridCommonUI", package: "purchases-hybrid-common"),
                "SkipRevenueCatLibrary"
            ],
            resources: [.process("Resources")],
            plugins: [.plugin(name: "skipstone", package: "skip")]
        ),
        .binaryTarget(
            name: "SkipRevenueCatLibrary",
            url: "https://api.github.com/repos/aduryagin/skip-revenuecat/releases/assets/195840500.zip",
            checksum: "56ca61db9566fa65c39ce96444d80044f734d7f69e24a37d935ed53ef8dadfd3"
        ),
        
        .testTarget(
            name: "SkipRevenuecatTests",
            dependencies: [
                "SkipRevenueCat",
                .product(name: "SkipTest", package: "skip")
            ],
            resources: [.process("Resources")],
            plugins: [.plugin(name: "skipstone", package: "skip")]
        )
    ]
)
