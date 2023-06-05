//
//  ManagerProtocol.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 17/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The type alias of the Analytics Properties -> [String: Any]
typealias AnalyticsProperties = [String: Any]

/// Analytics Manager Interface which defines set of methods have to be provided by every analytics manager.
protocol AnalyticsManagerProtocol {
    
    /// Set the analytics providers implementations associated with there provider identifier - it will reset all the current providers before setting the new value
    /// 
    /// This method has to be called before doing any logging
    /// - Parameter providers: A dictionary contains the provider identifier from the AnalyticsProviderIdentifier enum and the actual implementation of the provider itself
    func setAnalyticsProviders(_ providers: [AnalyticsProviderIdentifier: AnalyticsProviderProtocol])
    
    /// Logs an event
    ///
    /// Note: It will throw an exception if one of the analytics providers used by the event isn't initialized yet by the manager
    /// - Parameter event: The event which has to be logged, it has to implement the BaseAnalyticsEvent
    /// - Throws Fatal error when one of the analytics providers used by the event isn't initialized yet by the manager
    func logEvent(_ event: AnalyticsEventProtocol)
    
    /// Tracks a screen
    ///
    /// Note: It will throw an exception if one of the analytics providers used by the screen isn't initialized yet by the manager
    /// - Parameter screen: The screen which has to be tracked, it has to implement the BaseAnalyticsScreen
    /// - Throws Fatal error when one of the analytics providers used by the event isn't initialized yet by the manager
    func trackScreen(_ screen: AnalyticsScreenProtocol)
    
    /// Setup the profile identification of the user such as user ID ... etc - It's handled per provider
    ///
    /// This method could be called more than once for each provider(s) separately
    /// Note: It will throw an exception if one of the analytics providers used by the identification isn't initialized yet by the manager
    /// - Parameter profileID: The identification object which contains the IDs for the user in different provider(s), it has to implement the BaseAnalyticsProfileIdentification
    /// - Throws Fatal error when one of the analytics providers used by the event isn't initialized yet by the manager
    func setupProfileIdentification(_ profileID: AnalyticsProfileIdentificationProtocol)
    
    /// Setup the profile default properties of the user such as age, profile info ...etc - It's handled per provider
    ///
    /// This method could be called more than once for each provider(s) separately
    /// Note: It will throw an exception if one of the analytics providers used by the properties isn't initialized yet by the manager
    /// - Parameter properties: The profile properties object which contains the default properties for the user in different provider(s), it has to implement the BaseAnalyticsProfileProperties
    /// - Throws Fatal error when one of the analytics providers used by the event isn't initialized yet by the manager
    func setProfileProperties(_ properties: AnalyticsProfilePropertiesProtocol)
    
    /// Removes a provider from the pre-initialized providers
    /// - Parameter providerID: The provider ID to be deleted - it has to be from the AnalyticsProviderIdentifier enum
    /// - Throws Fatal error when one of the analytics providers used by the event isn't initialized yet by the manager
    func removeProvider(_ providerID: AnalyticsProviderIdentifier)
    
    /// Reset all the providers
    /// 
    /// Warning: You have to call the setAnalyticsProviders again before using any logging methods after resetting otherwise the app will throw exceptions as the providers isn't yet initialized
    func resetProviders()
}
