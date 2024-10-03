# SkipRevenueCat

![Preview](./preview.gif)

Documentation https://github.com/RevenueCat/purchases-kmp

# Installation
```swift
dependencies: [
    // Other dependencies here
    .package(url: "https://github.com/aduryagin/skip-revenuecat.git", branch: "main")
],
targets: [
    .target(
        name: "YourProjectName",
        dependencies: [
            // List your target dependencies here, including the new package
            .product(name: "SkipRevenueCat", package: "skip-revenuecat")
        ]
    ),
]
```

# Usage
Code samples can be found in ./skip-revenuecat-app