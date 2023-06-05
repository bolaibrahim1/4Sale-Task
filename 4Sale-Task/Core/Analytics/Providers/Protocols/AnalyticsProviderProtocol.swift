//
//  AnalyticsProviderProtocol.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 17/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The interface which contains all the needed parameters and methods to be a supported analytics provider in the analytics manager
protocol AnalyticsProviderProtocol {
    
    /// The provider identifier from the AnalyticsProviderIdentifier enum
    var providerID: AnalyticsProviderIdentifier { get }
    
    /// The default properties which will be sent with every event - it will be appended on the event parameters
    var defaultEventProperties: AnalyticsDefaultEventPropertiesProtocol { get }
    
    /// The default properties which will be sent with every screen - it will be appended on the screen parameters
    var defaultScreenProperties: AnalyticsDefaultScreenPropertiesProtocol { get }
    
    /// Logs an event
    /// - Parameter event: The event which has to be logged, it has to implement the BaseAnalyticsEvent
    /// - Throws Fata error if one of the analytics providers used by the event isn't initialized yet by the manager
    func logEvent(_ event: AnalyticsEventProtocol)
    
    /// Tracks a screen
    /// - Parameter screen: The screen which has to be tracked, it has to implement the BaseAnalyticsScreen
    /// - Throws Fata error if one of the analytics providers used by the event isn't initialized yet by the manager
    func trackScreen(_ screen: AnalyticsScreenProtocol)
    
    /// Setup the profile identification of the user such as user ID ... etc - It's handled per provider
    /// This method could be called more than once for each provider(s) separately
    /// - Parameter profileID: The identification object which contains the IDs for the user in different provider(s), it has to implement the BaseAnalyticsProfileIdentification
    /// - Throws Fata error if one of the analytics providers used by the event isn't initialized yet by the manager
    func setupProfileIdentification(_ profileIdentification: AnalyticsProfileIdentificationProtocol)
    
    /// Setup the profile default properties of the user such as age, profile info ...etc - It's handled per provider
    /// This method could be called more than once for each provider(s) separately
    /// - Parameter properties: The profile properties object which contains the default properties for the user in different provider(s), it has to implement the BaseAnalyticsProfileProperties
    /// - Throws Fata error if one of the analytics providers used by the event isn't initialized yet by the manager
    func setProfileProperties(_ properties: AnalyticsProfilePropertiesProtocol)
}
