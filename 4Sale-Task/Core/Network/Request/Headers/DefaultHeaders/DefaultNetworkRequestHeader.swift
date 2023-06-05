//
//  DefaultNetworkRequestHeader.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 26/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The default headers which will be used by any request initially, which you can update or override
struct DefaultNetworkRequestHeader: NetworkRequestHeadersProtocol {
    
    // request default headers
    var headers: [String: String]
    var authorizations: [String: String]
    
    /// initialize default request default headers and handle authorizations headers
    init() {
        self.headers = [:]
        self.authorizations = [:]
        //[
//            HTTPHeaderField.authentication.rawValue:
//                "\(HTTPHeaderField.authorization.rawValue) \(DevicePersistenceManager.shared().getToken() ?? "")"
//
//            HTTPHeaderField.authentication.rawValue:
//                "\(HTTPHeaderField.authorization.rawValue) eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI5NjU5NTg3NC1kYzgzLTQzMDktYTMyZi00YjJiN2EwZDIzM2IiLCJ0b2tlbiI6IkY0MDEzNjlBN0ZEMTQzMUVCMDVFOEUwREU5QjJBMzEzIiwiZXhwIjoxNjMyMTI4OTg5LCJpc3MiOiJFQSIsImF1ZCI6IkVBIn0.zK3SXkzwvLIOdoSGDoaitTdMDMmqMJegqV_6yUHQSz4"
            
//        ]
        
        headers[HTTPHeaderField.contentType.rawValue] =  ContentType.json.rawValue
        headers[HTTPHeaderField.acceptType.rawValue] = ContentType.json.rawValue
    }
}
