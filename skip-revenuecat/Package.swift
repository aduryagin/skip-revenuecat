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
        // .binaryTarget(
        //     name: "SkipRevenueCatLibrary",
        //     path: "../skip-revenuecat-library/skip-revenuecat-library/build/XCFrameworks/release/SkipRevenueCatLibrary.xcframework"
        // ),
       .binaryTarget(
           name: "SkipRevenueCatLibrary",
           url: "https://api.github.com/repos/aduryagin/skip-revenuecat/releases/assets/196665472.zip",
           checksum: "f26f419120d63a53a4906b65a1fb6fdfde26fe89e4634c9d4f989cefa02c82b4"
       ),
        
        .testTarget(
            name: "SkipRevenueCatTests",
            dependencies: [
                "SkipRevenueCat",
                .product(name: "SkipTest", package: "skip")
            ],
            resources: [.process("Resources")],
            plugins: [.plugin(name: "skipstone", package: "skip")]
        )
    ]
)
