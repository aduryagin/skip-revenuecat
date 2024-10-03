import Foundation
import SwiftUI

struct CustomPaywallContent: View {
    var body: some View {
        self.content
    }
    
    @ViewBuilder
    private var content: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                Text("Upgrade to premium")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 30)
                    .padding(.top, 30)
                
                VStack(alignment: .leading, spacing: 15) {
                    feature(
                        icon: "face.smiling",
                        title: "Let's Connect!",
                        description: "Have questions or feedback? Reach out via email or social media. Your feature requests are top priority for me."
                    )
                    
                    feature(
                        icon: "heart.fill",
                        title: "Support Development",
                        description: "Your subscribtions help me to keep the continuous improvement and growth of the app."
                    )
                    
                }
                
            }.frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    private func feature(
        icon: String,
        title: LocalizedStringKey,
        description: LocalizedStringKey,
        warning: LocalizedStringKey? = nil
    ) -> some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: icon)
                .font(
                    .system(
                        size: 18
                    )
                )
                .frame(width: 30)
                .offset(y: 2)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                Text(description)
                    .font(.system(size: 16))
            }
        }.padding(.horizontal)
    }
}
