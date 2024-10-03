import Foundation
import SkipRevenueCat

/*
 The class we'll use to publish CustomerInfo data to our app.
 */

class PurchasesDelegateHandler: NSObject {
    static let shared = PurchasesDelegateHandler()
}

extension PurchasesDelegateHandler: PurchasesDelegate {
    /**
     * Called whenever [Purchases] receives updated customer info. This may happen periodically
     * throughout the life of the app if new information becomes available.
     */
    /* SKIP INSERT: override */public func onCustomerInfoUpdated(customerInfo: CustomerInfo) {
        Store.shared.customerInfo = customerInfo
    }
    
    /**
     * App Store only. Called when a user initiates a promotional in-app purchase from the
     * App Store. If your app is able to handle a purchase at the current time, run the deferment
     * block in this method. If the app is not in a state to make a purchase: cache the
     * [startPurchase] block, then call the [startPurchase] block when the app is ready to make the
     * promotional purchase.
     */
    /* SKIP INSERT: override */public func onPurchasePromoProduct(
        product: StoreProduct,
        startPurchase: @escaping (
            @escaping (PurchasesError, KotlinBoolean) -> KotlinUnit,
            @escaping (StoreTransaction, CustomerInfo) -> KotlinUnit
        ) -> Void
    ) {
        #if !SKIP
        startPurchase { error, userCancelled in
            logger.error("Error: \(error)")
            
            return KotlinUnit()
        } _: {
            transaction, customerInfo in
            logger.log("\(customerInfo.description)")
            Store.shared.customerInfo = customerInfo
            
            return KotlinUnit()
        }
        #endif

    }

}
