//
//  DataExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 03/04/2022.
//  Copyright © 2022 myFawry. All rights reserved.
//

import Foundation

extension Data {
    var prettyString: NSString? {
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue) ?? nil
    }
}
