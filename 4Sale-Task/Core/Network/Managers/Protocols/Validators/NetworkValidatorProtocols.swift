//
//  NetworkValidatorProtocol.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// Defines the network validation methods that every manager has to implement before processing the network request
protocol NetworkValidatorProtocol {


    /// HTTP Validator which validate parameters types with request method and encoding types
    /// - Parameters:
    ///   - parametersType: The request parameter type -> Standard or Composite
    ///   - method: The used HTTP method within the request
    ///   - encoding: The used encoding in the request
    /// - Throws Fatal error When the validation of the parameters fails
    func httpMethodValidator(parametersType: NetworkRequestParametersType, method: RequestHTTPMethodType, encoding: RequestParameterEncoding)
}
