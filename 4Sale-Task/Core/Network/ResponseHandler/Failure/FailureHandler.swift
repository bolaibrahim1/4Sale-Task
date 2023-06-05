//
//  FailureHandler.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 26/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

/// Handles all the errors across the app, whether it's internal or HTTP errors
///
/// The implementation of the Error handling is decoupled from the providers in order to unify the implementation regardless of the used provider
class ErrorHandler {
            
    /// Handles the HTTP errors of a response
    /// - Parameters:
    ///   - responseCode: The HTTP error code of the response
    ///   - responseData: The request data
    ///   - completion: The completion which will be invoked based on the error
    static func handleHTTPError<T: Codable, E: InternalNetworkErrorProtocol> (_ responseCode: Int,
                                                                              responseData: Data?,
                                                                              completion: @escaping (Result<T, GeneralNetworkError<E>>) -> Void) {
        var networkError: NetworkErrors = NetworkErrors.genericHTTPError
        switch responseCode {
        case 400: break
//            networkError = NetworkErrors.badRequest(message: ParsingUtility.parseDataAsString(responseData ?? Data()))
        case 401:
            networkError = NetworkErrors.unauthorized
        case 403:
            networkError = NetworkErrors.forbidden
        case 404:
            networkError = NetworkErrors.notFound
        case 500...511:
            networkError = NetworkErrors.serverNotReachable
        case URLError.Code.notConnectedToInternet.rawValue:
            networkError = NetworkErrors.noInternetConnection
        case URLError.Code.timedOut.rawValue:
            networkError = NetworkErrors.requestTimeOut
        case URLError.Code.networkConnectionLost.rawValue:
            networkError = NetworkErrors.internetConnectionLost
        default:
            networkError = NetworkErrors.genericHTTPError
        }
        
        completion(.failure(GeneralNetworkError<E>(errorType: networkError, error: nil)))
    }
    
    /// Handles the internal errors which occur in the response objects
    ///
    /// Note: In Response Errors Or Internal Errors -> Means the HTTP Code is 200 but you still have an Error
    ///
    /// Example: Registration API gives 200 but the email is already existed before
    /// - Parameters:
    ///   - responseData: The raw data of the response
    ///   - responseCode: request response status code
    ///   - errorModel: The error class which will be used to map the failed response - it will be based on the E generic object which has to implement `InternalNetworkErrorInterface`
    /// - Returns: Internal request error with error model or parsing error
    static func checkForInternalError<E: InternalNetworkErrorProtocol> (_ responseData: Data,
                                                                        mapToModel errorModel: E.Type) -> GeneralNetworkError<E>? {
            do {
                let mappedResponse = try JSONDecoder().decode(errorModel.self, from: responseData)
                if mappedResponse.title != nil {
                    return GeneralNetworkError(errorType: NetworkErrors.internalRequestError, error: mappedResponse)
                }
            } catch let error {
                return GeneralNetworkError<E>(errorType: NetworkErrors.parsingError(message: error.localizedDescription), error: nil)
            }

        return nil
    }
}
