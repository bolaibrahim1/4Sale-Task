//
//  AnalyticsManager.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 17/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The Analytics Manager - it's the middle layer between the app and the analytics providers
///
/// It's a singleton instance which is used across the whole app
class AnalyticsManager: NSObject, AnalyticsManagerProtocol {
    
    // MARK: - Attributes
    private static var sharedInstance: AnalyticsManager?
    // Define analytics providers
    private var providers = [AnalyticsProviderIdentifier: AnalyticsProviderProtocol]()
    
    // MARK: - Init
    private override init() {}
    
    // MARK: - Methods
    static func shared() -> AnalyticsManager {
        guard let sharedInstance = sharedInstance else {
            // This force unwrapping isn’t handled as the app will crash if the static instance for some reason deallocated so we will be notified
            return AnalyticsManager()
        }
        return sharedInstance
    }
    
    func setAnalyticsProviders(_ providers: [AnalyticsProviderIdentifier: AnalyticsProviderProtocol]) {
        self.providers = providers
    }
    
    func logEvent(_ event: AnalyticsEventProtocol) {
        for providerIdentifier in event.providersIdentifiers {
            guard let provider = providers[providerIdentifier] else {
                fatalError("\(providerIdentifier.rawValue) has not been initialized yet")
            }
            provider.logEvent(event)
        }
    }
    
    func trackScreen(_ screen: AnalyticsScreenProtocol) {
        for providerIdentifier in screen.providersIdentifiers {
            guard let provider = providers[providerIdentifier] else {
                fatalError("\(providerIdentifier.rawValue) has not been initialized yet")
            }
            provider.trackScreen(screen)
        }
    }
    
    func setupProfileIdentification(_ profileID: AnalyticsProfileIdentificationProtocol) {
        for providerIdentifier in profileID.providersIdentifiers {
            guard let provider = providers[providerIdentifier] else {
                fatalError("\(providerIdentifier.rawValue) has not been initialized yet")
            }
            provider.setupProfileIdentification(profileID)
        }
    }
    
    func setProfileProperties(_ properties: AnalyticsProfilePropertiesProtocol) {
        for providerIdentifier in properties.providersIdentifiers {
            guard let provider = providers[providerIdentifier] else {
                fatalError("\(providerIdentifier.rawValue) has not been initialized yet")
            }
            provider.setProfileProperties(properties)
        }
    }
    
    func removeProvider(_ providerID: AnalyticsProviderIdentifier) {
        providers.removeValue(forKey: providerID)
    }
    
    func resetProviders() {
        providers = [:]
    }
    
    static func destroy() {
        sharedInstance = nil
    }
}
