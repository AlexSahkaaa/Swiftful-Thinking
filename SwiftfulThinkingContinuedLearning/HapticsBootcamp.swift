//
//  HapticsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Alex Kolsa on 14.09.2022.
//

import SwiftUI

class HapticManager {
    
    static let shared = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
        
    }
    
    func impact(type: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: type)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Success") { HapticManager.shared.notification(type: .success) }
            Button("Error") { HapticManager.shared.notification(type: .error) }
            Button("Warning") { HapticManager.shared.notification(type: .warning) }
            Divider()
            Button("Heavy") { HapticManager.shared.impact(type: .heavy) }
            Button("Medium") { HapticManager.shared.impact(type: .medium) }
            Button("Light") { HapticManager.shared.impact(type: .light) }
            Button("Rigid") { HapticManager.shared.impact(type: .rigid) }
            Button("Soft") { HapticManager.shared.impact(type: .soft) }
        }
    }
}

struct HapticsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticsBootcamp()
    }
}
