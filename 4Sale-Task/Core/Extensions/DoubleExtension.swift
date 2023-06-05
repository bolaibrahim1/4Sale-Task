//
//  DoubleExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 07/07/2022.
//  Copyright © 2022 myFawry. All rights reserved.
//

import Foundation

extension Double {
    
    func rounded(digits: Int) -> Double {
        let behavior = NSDecimalNumberHandler(roundingMode: .bankers, scale: Int16(digits), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        return NSDecimalNumber(value: self).rounding(accordingToBehavior: behavior).doubleValue
    }
    
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "en")
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
