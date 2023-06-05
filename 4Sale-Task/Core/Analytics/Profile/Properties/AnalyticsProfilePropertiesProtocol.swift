//
//  AnalyticsProfilePropertiesProtocol.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 17/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The interface which contains all the required parameters and properties to be linked with the user profile in an analytics provider
protocol AnalyticsProfilePropertiesProtocol {
    
    /// The properties of a user to be linked with his profile
    var properties: AnalyticsProperties { get }
    
    /// The provider identifiers which that event is supporting, by default it contains all the identifiers
    /// Note: Only update it if you want specific providers to fire this event
    var providersIdentifiers: [AnalyticsProviderIdentifier] { get }
}

extension AnalyticsProfilePropertiesProtocol {
    var providers: [AnalyticsProviderIdentifier] {
        AnalyticsProviderIdentifier.allCases
    }
}
