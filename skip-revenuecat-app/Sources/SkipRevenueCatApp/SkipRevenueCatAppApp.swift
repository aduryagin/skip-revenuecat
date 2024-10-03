import Foundation
import OSLog
import SwiftUI
import SkipRevenueCat

let logger: Logger = Logger(subsystem: "skip.revenuecat-app", category: "SkipRevenueCatApp")

/// The Android SDK number we are running against, or `nil` if not running on Android
let androidSDK = ProcessInfo.processInfo.environment["android.os.Build.VERSION.SDK_INT"].flatMap({ Int($0) })

/// The shared top-level view for the app, loaded from the platform-specific App delegates below.
///
/// The default implementation merely loads the `ContentView` for the app and logs a message.
public struct RootView : View {
    public init() {
        #if os(iOS) || SKIP

        if (Purchases.isConfigured) { return }

        /* Enable debug logs before calling `configure`. */
        Purchases.logLevel = LogLevel.DEBUG

        /*
         Initialize the RevenueCat Purchases SDK.
         
         - `appUserID` is nil by default, so an anonymous ID will be generated automatically by the Purchases SDK.
         Read more about Identifying Users here: https://docs.revenuecat.com/docs/user-ids
         
         - `observerMode` is false by default, so Purchases will automatically handle finishing transactions.
         Read more about Observer Mode here: https://dz gocs.revenuecat.com/docs/observer-mode
         */

        Purchases.configure(apiKey: StoreConstants.apiKey)
        /* Set the delegate to our shared instance of PurchasesDelegateHandler */
        Purchases.sharedInstance.delegate = PurchasesDelegateHandler.shared
        #endif
    }

    public var body: some View {
        ContentView()
            .task {
                logger.log("Welcome to Skip on \(androidSDK != nil ? "Android" : "Darwin")!")
                logger.warning("Skip app logs are viewable in the Xcode console for iOS; Android logs can be viewed in Studio or using adb logcat")
            }
    }
}

#if !SKIP
public protocol SkipRevenueCatAppApp : App {
}

/// The entry point to the SkipRevenueCatApp app.
/// The concrete implementation is in the SkipRevenueCatAppApp module.
public extension SkipRevenueCatAppApp {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
#endif
