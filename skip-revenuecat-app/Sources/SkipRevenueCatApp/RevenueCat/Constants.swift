import Foundation
import SwiftUI

struct StoreConstants {
    
    #if SKIP
    static let apiKey = "GOOGLE_KEY"
    #else
    static let apiKey = "APPLE_KEY"
    #endif
    
    static let entitlementID = "Premium"
    
}
