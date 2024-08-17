//
//  String.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 12/08/2024.
//

import Foundation

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
