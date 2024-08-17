//
//  String.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 12/08/2024.
//

import Foundation

extension String {
    var removingHTMLOccurrences: String {
        return replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
