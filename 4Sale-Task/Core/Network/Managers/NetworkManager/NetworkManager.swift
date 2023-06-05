//
//  NetworkManager.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The network manager implementation to be used across the whole app as a single entry for the network provider
class NetworkManager: NetworkManagerProtocol {
    // MARK: - Attributes
    private var networkProvider: BaseNetworkProvider
    
    /// initializes the network manager with TokensProvider and AuthUserStateProtocol
    /// - Parameter networkProvider: The used network provider which is associated with this network manager
    init(networkProvider: BaseNetworkProvider = AlamofireNetworkProvider()) {
        // BaseNetworkProvider is used instead of NetworkProvider to ensure that the rest of the interfaces methods are not visible - only the request methods will be visible
        self.networkProvider = networkProvider
    }
    

    /// network validator which validate network request attributes
    /// - Parameter request: network request attribues
    func validate(_ request: NetworkRequest) -> BaseNetworkProvider {
        httpMethodValidator(parametersType: request.parameters, method: request.method, encoding: request.encoding)
//        log.network("Network URL: \(request.baseURL + request.endPoint)", level: .network, parameter: ["method: ": request.method, "parameters: ": request.parameters])
        return networkProvider
    }
    
    /// HTTP Validator which validate parameters types with request method and encoding types
    /// - Parameters:
    ///   - parametersType: request parameters which can be query parameter or post parameter
    ///   - method: request http method
    ///   - encoding: request encoding type
    func httpMethodValidator(parametersType: NetworkRequestParametersType, method: RequestHTTPMethodType, encoding: RequestParameterEncoding) {
        NetworkValidator.httpMethodValidator(parametersType: parametersType, method: method, encoding: encoding)
    }
}
