//
//  NetworkValidator.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 28/02/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

/// Network Validator
class NetworkValidator {

    /// HTTP Method Validator
    /// - Parameters:
    ///   - parametersType: he type of the parameter
    ///   - method: The HTTP method of the request
    ///   - encoding: The encoding which will be used to encode the parameters
    /// - Throws: Fatal error if the passed values violates the proper construction of the request
    static func httpMethodValidator(parametersType: NetworkRequestParametersType, method: RequestHTTPMethodType, encoding: RequestParameterEncoding) {
        switch parametersType {
        case .standard:
            if encoding == .urlEncoding && method == .post {
                fatalError("You can't use HTTP method POST with URL Encoding")
            } else if encoding == .jsonEncoding && method == .get {
                fatalError("You can't use HTTP method GET with JSON Encoding")
            }
        case .composite:
            if method == .get {
                fatalError("You can't use HTTP method Get with Composite Parameters")
            }
        }
    }
}
