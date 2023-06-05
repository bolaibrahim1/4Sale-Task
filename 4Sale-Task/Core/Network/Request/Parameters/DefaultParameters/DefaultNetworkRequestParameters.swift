//
//  DefaultNetworkRequestParameters.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 06/02/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

/// The default headers which will be used by any request initially, which you can update or override
struct DefaultNetworkRequestParameters {
    
    // request default parameters
    private var commonParameters: NetworkRequestParameters?
    private var extendedParamsDict: NetworkRequestParameters?
    private var notificationMessageStreamingDict: NetworkRequestParameters?
    
    /// initialize default request default headers and handle authorizations headers
    init(requestParams: NetworkRequestParameters) {
        commonParameters = [:]
    }
    
    
    func getCommonParameters() -> NetworkRequestParameters{
        return commonParameters ?? [:]
    }
}
