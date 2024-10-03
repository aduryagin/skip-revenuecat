// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SkipRevenueCat",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "SkipRevenueCat",
            targets: ["SkipRevenueCat"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SkipRevenueCat",
            dependencies: []
          ),
        .testTarget(
            name: "SkipRevenueCatTests",
            dependencies: ["SkipRevenueCat"]
        ),
    ]
)