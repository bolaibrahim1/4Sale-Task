//
//  AlamofireNetworkProvider.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetworkProvider: NetworkProvider {
    
    // configure Session Manager for request configurations
    static let sessionManager: Session = {
        let networkLogger = GitNetworkLogger()
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        return Session(configuration: configuration, eventMonitors: [networkLogger])
    }()
    /// initializes the network manager with TokensProvider and AuthUserStateProtocol
    init() {}
    
    /// Creates a `DataRequest` using the `SessionManager` to retrieve the contents of a URL based on the
    /// specified `NetworkRequest`.
    ///
    /// - Parameters:
    ///   - request: the `NetworkRequest` builder
    ///   - successModel: `Codable` model `<T>` to which the response should be mapped
    ///   - errorModel: `InternalNetworkErrorProtocol` model `<E>` to which the error response should be mapped
    func request<T: Codable, E: InternalNetworkErrorProtocol>(_ request: NetworkRequest, mapToModel successModel: T.Type, mapToErrorModel errorModel: E.Type, completion: @escaping (Result<T, GeneralNetworkError<E>>) -> Void) {
        makeRequest(request, mapToModel: successModel, mapToErrorModel: errorModel.self, completion: completion)
    }
    
    /// create a `DataRequest` using the `SessionManager` to retrieve the contents of a URL based on the
    /// specified `NetworkRequest`.
    ///
    /// - Parameters:
    ///   - request: The `NetworkRequest`
    ///   - successModel: `Codable` model `<T>` to which the response should be mapped
    ///   - errorModel: `InternalNetworkErrorProtocol` model `<E>` to which the error response should be mapped
    ///   - completion:  Network request for data task with success model and the error model will be the default one
    func request<T: Codable>(_ request: NetworkRequest, mapToModel successModel: T.Type, completion: @escaping (Result<T, GeneralNetworkError<InternalNetworkError>>) -> Void) {
        makeRequest(request, mapToModel: successModel, mapToErrorModel: InternalNetworkError.self, completion: completion)
    }
    
    /// Request builder that build request from network manager
    /// - Parameters:
    ///   - request: network request builder attributes
    ///   - successModel: `Codable` model `<T>` to which the response should be mapped
    ///   - errorModel: `InternalNetworkErrorProtocol` model `<E>` to which the error response should be mapped
    ///   - completion:  Network request for data task with success model and the error model will be the default one
    private func makeRequest<T: Codable, E: InternalNetworkErrorProtocol>(_ request: NetworkRequest, mapToModel successModel: T.Type, mapToErrorModel errorModel: E.Type, completion: @escaping (Result<T, GeneralNetworkError<E>>) -> Void) {
        
        let headers = HTTPHeaders(request.headers.allHeaders)
        let url = request.baseURL + request.endPoint
        let method = mapHTTPMethod(httpMethod: request.method)
        let encoding = mapParameterEncoding(parameterEncoding: request.encoding)
        var parameters: NetworkRequestParameters = [:]
        
        // Checking request parameters for multiple parameters encoding types
        switch request.parameters {
        case let .standard(params):
            parameters = params
        case let .composite(bodyParams, _):
            // uncomment it later
            // url = NetworkUtility.encodeParametersToURL(url, parameter: queryParams) ?? ""
            parameters = bodyParams
        }
        //        parameters = parameters.mergeOnto(target: DefaultNetworkRequestParameters(requestParams: parameters).getCommonParameters())
        
        AlamofireNetworkProvider.sessionManager.sessionConfiguration.timeoutIntervalForRequest = request.timeOutSeconds
        AlamofireNetworkProvider.sessionManager.sessionConfiguration.timeoutIntervalForResource = request.timeOutSeconds
        
        //        log.network("Network URL: \(url)", level: .network, parameter: ["method": method, "parameters": parameters])
        AlamofireNetworkProvider.sessionManager.request(url,
                                                        method: method,
                                                        parameters: parameters,
                                                        encoding: encoding,
                                                        headers: headers).responseData { response in
            let responseCode = response.response?.statusCode ?? 0
            switch response.result {
            case let .success(data):
                // Added an extra check on the response code as the Alamofire comes to the success block if the data is not null even if there is an http error
                switch responseCode {
                case 200...299:
                    //                                        log.network("Network response Code: \(responseCode)")
                    SuccessHandler.mapSuccessfulResponse(responseCode, responseData: data, mapToModel: successModel, errorModel: errorModel, completion: completion)
                default:
                    //                                        log.network("Network default response Code: \(responseCode)")
                    SuccessHandler.mapSuccessfulResponse(responseCode, responseData: data, mapToModel: successModel, errorModel: errorModel, completion: completion)
                    //ErrorHandler.handleHTTPError(responseCode, responseData: response.data, completion: completion)
                }
            case .failure:
                //                                    log.error("Network Error response Code: \(responseCode)")
                ErrorHandler.handleHTTPError(responseCode, responseData: response.data, completion: completion)
            }
        }
    }
    
    /// Mapping HTTP method from request to provider
    /// - Parameter httpMethod: request method type
    internal func mapHTTPMethod(httpMethod: RequestHTTPMethodType) -> HTTPMethod {
        switch httpMethod {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        case .put:
            return HTTPMethod.put
        case .delete:
            return HTTPMethod.delete
        }
    }
    
    /// Encoding mapping method to encoding parameters
    /// - Parameter parameterEncoding: specify encoding type passed on request parameters
    internal func mapParameterEncoding(parameterEncoding: RequestParameterEncoding) -> ParameterEncoding {
        switch parameterEncoding {
        case .urlEncoding:
            return URLEncoding.default
        case .jsonEncoding:
            return JSONEncoding.default
        }
    }
}
