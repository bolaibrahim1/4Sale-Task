//
//  UserIdentification.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 25/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The interface which contains all the required parameters and properties for identifying the user in an analytics provider
protocol AnalyticsProfileIdentificationProtocol {
    
    /// The ID which will be used to identify the user in the analytics provider
    var profileID: String { get }
    
    /// The provider identifiers which that event is supporting, by default it contains all the identifiers
    /// Note: Only update it if you want specific providers to fire this event
    var providersIdentifiers: [AnalyticsProviderIdentifier] { get }
}

extension AnalyticsProfileIdentificationProtocol {
    var providersIdentifiers: [AnalyticsProviderIdentifier] {
        AnalyticsProviderIdentifier.allCases
    }
}
