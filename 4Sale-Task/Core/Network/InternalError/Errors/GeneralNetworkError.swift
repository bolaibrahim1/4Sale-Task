//
//  GeneralNetworkError.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The network error which is passed from the network layer to the upper layers
class GeneralNetworkError <E: InternalNetworkErrorProtocol> : Error {
    
    /// The error type from the NetworkErrors enum
    var errorType: NetworkErrors
    
    /// The error object which will be parsed based on the E generic object which has to implement InternalNetworkErrorInterface
    var error: E?
    
    init(errorType: NetworkErrors, error: E?) {
        self.errorType = errorType
        self.error = error
    }
}


