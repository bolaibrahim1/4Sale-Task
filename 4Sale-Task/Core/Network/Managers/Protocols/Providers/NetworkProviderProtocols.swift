//
//  NetworkProviderProtocols.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// The network provider interface that every provider has to implement to be used in the network manager
protocol NetworkProvider: BaseNetworkProvider, NetworkProviderHTTPMethodProtocol, NetworkProviderParameterEncodingProtocol {}

/// The bsase network provider
protocol BaseNetworkProvider {
    
    /// Make a request and passes the success model and the error model
    /// - Parameters:
    ///   - request: The network request and all of its parameters
    ///   - successModel: The success class which will be used to map the successful response - it will be based on the T generic object which has to implement `Codable`
    ///   - errorModel: errorModel The error class which will be used to map the failed response - it will be based on the E generic object which has to implement `InternalNetworkErrorInterface`
    /// - Returns: A `Result` with a success model or error model based on the response from the API
    func request <T: Codable, E: InternalNetworkErrorProtocol> (_ request: NetworkRequest, mapToModel successModel: T.Type, mapToErrorModel errorModel: E.Type, completion: @escaping (Result<T, GeneralNetworkError<E>>) -> Void)
    
    /// create a `DataRequest` using the `SessionManager` to retrieve the contents of a URL based on the
    /// specified `NetworkRequest`.
    ///
    /// - Parameters:
    ///   - request: The network request and all of its parameters
    ///   - successModel: The success class which will be used to map the successful response - it will be based on the T generic object which has to implement `Codable`
    /// - Returns: A RequestResult class with a success model or error model based on the response from the API
    func request <T: Codable> (_ request: NetworkRequest, mapToModel successModel: T.Type, completion: @escaping (Result<T, GeneralNetworkError<InternalNetworkError>>) -> Void)
}

/// Converts the HTTP method of the app to the provider way
protocol NetworkProviderHTTPMethodProtocol {
    associatedtype ProviderHTTPMethod

    /// Mapping HTTP method from request to provider
    /// - Parameter httpMethod: request method type
    func mapHTTPMethod (httpMethod: RequestHTTPMethodType) -> ProviderHTTPMethod
}

/// Converts the encoding method of the app to the provider way
protocol NetworkProviderParameterEncodingProtocol {
    associatedtype ProviderParameterEncoding

    /// Encoding mapping method to encoding parameters
    /// - Parameter parameterEncoding: specify encoding type passed on request parameters
    func mapParameterEncoding (parameterEncoding: RequestParameterEncoding) -> ProviderParameterEncoding
}
