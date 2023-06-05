//
//  EventGenerator.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 03/03/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

class EventGenerator: AnalyticsEventProtocol {
    
    var name: EventName
    
    var properties: AnalyticsProperties?
    
    var providersIdentifiers: [AnalyticsProviderIdentifier]

    init(name: EventName, properties: AnalyticsProperties?, providers: [AnalyticsProviderIdentifier] = AnalyticsProviderIdentifier.allCases) {
        self.name = name
        self.properties = properties
        self.providersIdentifiers = providers
    }
}
