//
//  InternalNetworkError.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The pre-defined internal network error used in the app between the network layer and the features
class InternalNetworkError: InternalNetworkErrorProtocol, Codable {
    var title: String?
    var status: Bool?
    var code: Int?
}
