// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

// Skip transpiles this to: import multi.platform.library.*

#if os(macOS)
// MacOS is not currently supported in KMP
// https://github.com/RevenueCat/purchases-kmp/tree/main?tab=readme-ov-file#requirements
@_exported import RevenueCat
@_exported import RevenueCatUI

public typealias PurchasesError = Error
public extension Purchases {
    static var sharedInstance: Purchases {
        RevenueCat.Purchases.shared
    }
}
public typealias KotlinBoolean = Bool
public typealias KotlinUnit = Void
#endif

#if os(iOS)
@_exported import SkipRevenuecatLibrary
import PurchasesHybridCommon
import PurchasesHybridCommonUI

public typealias CustomerInfo = ModelsCustomerInfo
public typealias Offerings = ModelsOfferings
public typealias StoreProduct = ModelsStoreProduct
public typealias PurchasesError = ModelsPurchasesError
public typealias StoreTransaction = ModelsStoreTransaction

public extension LogLevel {
    static var DEBUG: LogLevel {
        return .debug
    }
    static var ERROR: LogLevel {
        return .error
    }
    static var INFO: LogLevel {
        return .info
    }
    static var VERBOSE: LogLevel {
        return .verbose
    }
    static var WARN: LogLevel {
        return .warn
    }
}

public extension Purchases {
    static var isConfigured: Bool {
        Purchases.companion.isConfigured
    }
    
    static var sharedInstance: Purchases {
        Purchases.companion.sharedInstance
    }
    
    static var logLevel: LogLevel {
        get {
            Purchases.companion.logLevel
        }
        
        set {
            Purchases.companion.logLevel = newValue
        }
    }
}
#elseif SKIP
import com.revenuecat.purchases.kmp.__
// I cannot re-export packages here, so I use typealiases
public typealias Purchases = com.revenuecat.purchases.kmp.Purchases
public typealias CustomerInfo = com.revenuecat.purchases.kmp.models.CustomerInfo
public typealias Offerings = com.revenuecat.purchases.kmp.models.Offerings
public typealias StoreProduct = com.revenuecat.purchases.kmp.models.StoreProduct
public typealias PurchasesDelegate = com.revenuecat.purchases.kmp.PurchasesDelegate
public typealias PurchasesError = com.revenuecat.purchases.kmp.models.PurchasesError
public typealias StoreTransaction = com.revenuecat.purchases.kmp.models.StoreTransaction
public typealias KotlinBoolean = Bool
public typealias KotlinUnit = Unit
public typealias LogLevel = com.revenuecat.purchases.kmp.LogLevel
#endif

#if os(iOS) || SKIP
public extension Purchases {
    static func configure(apiKey: String, builder: @escaping (PurchasesConfiguration.Builder) -> Void = {_ in }) {
        #if !SKIP
        Purchases.companion.configure(apiKey: apiKey, builder: builder)
        #else
        Purchases.configure(PurchasesConfiguration(apiKey: apiKey, builder: builder))
        Void
        #endif
    }
}
#endif
