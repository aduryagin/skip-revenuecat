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
    dependencies: [
        .package(path: "skip-revenuecat"),
    ],
    targets: [
        .target(
            name: "SkipRevenueCat",
            dependencies: [
                "./skip-revenuecat",
            ]
          ),
        .testTarget(
            name: "SkipRevenueCatTests",
            dependencies: ["SkipRevenueCat"]
        ),
    ]
)
