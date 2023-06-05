//
//  NetworkManagerProtocol.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The Network Manager Interface which every network manager has to implement to be injected and used with the app
protocol NetworkManagerProtocol: NetworkValidatorProtocol {
        
    /// Validates the passed request and it's parameters first then passes the Network Provider to do the actual request
    /// - Parameter request: The network request which will be fired
    /// - Returns  The network provider interface which will be used to fire the request
    func validate(_ request: NetworkRequest) -> BaseNetworkProvider
}
