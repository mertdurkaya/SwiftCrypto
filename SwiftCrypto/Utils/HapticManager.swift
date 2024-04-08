//
//  HapticManager.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 08/04/2024.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
