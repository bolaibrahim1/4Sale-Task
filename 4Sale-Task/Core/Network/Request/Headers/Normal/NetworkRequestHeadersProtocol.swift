//
//  CommonHeadersProtocol.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 26/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The headers methods and variables used by a request
protocol NetworkRequestHeadersProtocol: NetworkRequestAuthorizationProtocol {
    
    /// The headers used by a request
    var headers: [String: String] { get }
    
    /// initialize default request default headers and handle authorizations headers
    init()
}

/// setting the request headers from default headers and authorization headers
extension NetworkRequestHeadersProtocol {
    
    /// Retrieves all the headers combined together - Auth Headers & HTTP Headers
    var allHeaders: [String: String] {
        var allHeaders = headers
        for (key, value) in authorizations {
            allHeaders[key] = value
        }
        return allHeaders
    }
}
