//
//  NetworkErrors.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 10/05/2021.
//

import Foundation

/// The Identifiers of the different HTTP errors and internal network errors which is used across the whole app
enum NetworkErrors: Equatable {
    case noError
    case parsingError(message: String)
    case noResponse
    case unknownAppError
    case noInternetConnection
    case internetConnectionLost
    case requestTimeOut
    case internalRequestError
    // HTTP Errors
    case forbidden
    case unauthorized
    case genericHTTPError
    case serverNotReachable
    case notFound
    case badRequest(message: String)
}
