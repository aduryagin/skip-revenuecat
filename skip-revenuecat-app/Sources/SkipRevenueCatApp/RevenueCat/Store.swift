
import Foundation
import SkipRevenueCat
import SwiftUI

class Store: ObservableObject {
    public static let shared = Store()
    
    /* The latest CustomerInfo from RevenueCat. Updated by PurchasesDelegate whenever the Purchases SDK updates the cache */
    @Published var customerInfo: CustomerInfo? {
        didSet {
            #if !os(macOS) || SKIP
            let entitlement = customerInfo?.entitlements.get(s: StoreConstants.entitlementID)
            subscriptionActive = entitlement?.isActive == true
            
            if (!subscriptionActive && entitlement?.latestPurchaseDateMillis != nil) {
                logger.info("Subscription is not active")
            }
            #endif
        }
    }
    
    /* The latest offerings - fetched on app launch */
    @Published var offerings: Offerings? = nil
    
    /* Set from the didSet method of customerInfo above, based on the entitlement set in Constants.swift */
    @Published var subscriptionActive: Bool = false
}
