//
//  UIApplication.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 25/03/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
     
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
