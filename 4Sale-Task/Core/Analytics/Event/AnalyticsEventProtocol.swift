//
//  AnalyticsEventProtocol.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 23/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The base analytics event which is used by the analytics manager through out the whole app, it contains the different required information for an analytics event such as event name, properties ...etc
protocol AnalyticsEventProtocol {
    
    /// The event name
    var name: EventName { get }
    
    /// The properties to be linked with an event
    var properties: AnalyticsProperties? { get }
    
    /// The provider identifiers which that event is supporting, by default it contains all the identifiers
    /// Note: Only update it if you want specific providers to fire this event
    var providersIdentifiers: [AnalyticsProviderIdentifier] { get }
}
