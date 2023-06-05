//
//  SuccessHandler.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 26/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation

class SuccessHandler {

    /// Handling network mapping success response and checking for internal error and parsing error
    /// - Parameters:
    ///   - responseCode: request response status code
    ///   - responseData: `Data` request response data as generic data
    ///   - successModel: `Codable` model `<T>` which mapped from response data
    ///   - errorModel:  `InternalNetworkErrorProtocol` model `<E>` which return from internal error or parsing error
    ///   - completion: based on the validate the response return success model and error model.
    static func mapSuccessfulResponse <T: Codable, E: InternalNetworkErrorProtocol> (_ responseCode: Int,
                                                                                     responseData: Data?,
                                                                                     mapToModel successModel: T.Type,
                                                                                     errorModel: E.Type,
                                                                                     completion: @escaping (Result<T, GeneralNetworkError<E>>) -> Void) {
        if let responseData = responseData {
            do {
                // check if there is an internal Errors
                let error = ErrorHandler.checkForInternalError(responseData, mapToModel: errorModel)
                if let error = error {
//                    log.error("Network Error: \(error.error?.title ?? error.localizedDescription) ⇢⇢⇢⇢ Network Error response Code: \(error.error?.code ?? 0)")
                    completion(.failure(error))
                } else {
                    let mappedResponse = try JSONDecoder().decode(successModel.self, from: responseData)
//                    log.network("Network mapped Response: \(mappedResponse)")
                    completion(.success(mappedResponse))
                }
            } catch let error {
                // return if can't parse response data
//                log.network("Network Error: \(error.localizedDescription)")
                completion(.failure(GeneralNetworkError<E>(errorType: NetworkErrors.parsingError(message: error.localizedDescription), error: nil)))
            }
        } else {
//            log.network("Network response Data is null")
            completion(.failure(GeneralNetworkError<E>(errorType: NetworkErrors.noResponse, error: nil)))
        }
    }
}
