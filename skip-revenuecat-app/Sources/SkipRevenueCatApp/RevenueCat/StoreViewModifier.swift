import Foundation
import SwiftUI
import SkipRevenueCat
import OSLog

struct StoreViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .task {
            logger.info("Start fetching offerings")
            
            #if !os(macOS) || SKIP
            Purchases.sharedInstance.getOfferings(onError: { error in
                logger.error("Error fetching offerings: \(error)")
            }, onSuccess: { offerings in
                Store.shared.offerings = offerings
            })
            #endif
        }
    }
}

