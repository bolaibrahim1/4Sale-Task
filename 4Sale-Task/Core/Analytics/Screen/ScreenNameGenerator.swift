//
//  ScreenNameGenerator.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 03/03/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

class ScreenNameGenerator: AnalyticsScreenProtocol {
    
    var name: ScreenName
    
    var properties: AnalyticsProperties?
    
    var providersIdentifiers: [AnalyticsProviderIdentifier]
    
    init(name: ScreenName, properties: AnalyticsProperties?, providers: [AnalyticsProviderIdentifier] = AnalyticsProviderIdentifier.allCases) {
        self.name = name
        self.properties = properties
        self.providersIdentifiers = providers
    }
}
