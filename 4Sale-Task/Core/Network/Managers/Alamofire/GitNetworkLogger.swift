//
//  GitNetworkLogger.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//

import Foundation
import Alamofire

/// NetworkLogging
class GitNetworkLogger: EventMonitor {
    // MARK: - Attributes
    let queue = DispatchQueue(label: "com.fawry.myFawryTesting.networklogger")

    /// Print request description
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }

    /// Make Request Logger
    /// - Parameters:
    ///   - request: The network request
    ///   - response: The network response
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else { return }
        if let json = try? JSONSerialization
            .jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
