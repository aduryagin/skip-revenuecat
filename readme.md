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

Change AndroidManifest.xml
```xml
<!-- ... -->

<!-- permission needed for in-app billing -->
<uses-permission android:name="com.android.vending.BILLING" />

<!-- ... -->

<!-- https://www.revenuecat.com/docs/getting-started/installation/kotlin-multiplatform#import-purchases -->
<!-- Make sure that PRODUCT_BUNDLE_IDENTIFIER does not contain hyphens "my-app" should be written as "my_app" -->
<provider
    android:name="androidx.startup.InitializationProvider"
    android:authorities="${PRODUCT_BUNDLE_IDENTIFIER}.androidx-startup"
    android:exported="false"
    tools:node="merge">
    <meta-data
        android:name="androidx.work.WorkManagerInitializer"
        android:value="androidx.startup"
        tools:node="remove"
    />
</provider>

<!-- ... -->
```

[Set API keys in ./skip-revenuecat-app/Sources/SkipRevenueCatApp/RevenueCat/Constants.swift](skip-revenuecat-app/Sources/SkipRevenueCatApp/RevenueCat/Constants.swift)

# Usage
Code samples can be found in [./skip-revenuecat-app/Sources/SkipRevenueCatApp/](./skip-revenuecat-app/Sources/SkipRevenueCatApp/)