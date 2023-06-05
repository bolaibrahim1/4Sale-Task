//
//  AccessTokenAuthorization.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 26/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The Authorization methods and variables used by a request
protocol NetworkRequestAuthorizationProtocol {
    /// The Authorization headers used by a request
    var authorizations: [String: String] { get }
}
