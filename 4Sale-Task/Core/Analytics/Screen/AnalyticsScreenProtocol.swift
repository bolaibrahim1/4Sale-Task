//
//  AnalyticsScreenProtocol.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 25/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The base analytics screen which is used by the analytics manager through out the whole app, it contains the different required information for an analytics screen such as screen name, properties ...etc
protocol AnalyticsScreenProtocol {
    
    /// The screen name
    var name: ScreenName { get }
    
    /// The properties to be linked with a screen
    var properties: AnalyticsProperties? { get }
    
    /// The provider identifiers which that event is supporting, by default it contains all the identifiers
    /// Note: Only update it if you want specific providers to fire this event
    var providersIdentifiers: [AnalyticsProviderIdentifier] { get }
}
