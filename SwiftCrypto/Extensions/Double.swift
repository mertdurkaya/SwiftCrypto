//
//  Double.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 19/03/2024.
//

import Foundation

extension Double {
    
    
    /// Converts a Double into a Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 -> $1,234.56
    /// ```
    private var currencyFormatter2 : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as String with 2 decimal places
    /// ```
    /// Convert 1234.56 -> "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 -> $1,234.56
    /// Convert 12.345 -> $12.345
    /// Convert 0.123456 -> $0.123456
    /// Convert 123456 -> $123456.00
    /// Convert 123456.789 -> $123456.789
    /// ```
    private var currencyFormatter6 : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 -> "$1,234.56"
    /// Convert 12.345 -> "$12.345"
    /// Convert 0.123456 -> "$0.123456"
    /// Convert 123456 -> "$123456.00"
    /// Convert 123456.789 -> "$123456.789"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    /// Converts a Double into a String representation
    /// ```
    /// Convert 1.2345 -> "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into a String representation with percent
    /// ```
    /// Convert 1.2345 -> "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000_000...:
            return sign + (num / 1_000_000_000_000).asNumberString() + "Tr"
        case 1_000_000_000...:
            return sign + (num / 1_000_000_000).asNumberString() + "B"
        case 1_000_000...:
            return sign + (num / 1_000_000).asNumberString() + "M"
        case 1_000...:
            return sign + (num / 1_000).asNumberString() + "K"
        case 0...:
            return sign + self.asNumberString()
            
        default:
            return "\(sign)\(self)"
        }
    }
}
