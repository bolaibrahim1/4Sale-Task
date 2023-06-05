//
//  Utilities.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import UIKit

struct AppUtility {
    
    func getFormatedDateString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        dateFormatter.locale = NSLocale(localeIdentifier: "us") as Locale

        let date = Date()

        let formattedDateString = dateFormatter.string(from: date)
        return formattedDateString
    }
}
