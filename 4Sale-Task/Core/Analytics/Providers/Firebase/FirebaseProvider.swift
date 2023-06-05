//
//  FirebaseProvider.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 03/03/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation
import Firebase

class FirebaseProvider: AnalyticsProviderProtocol {
    
    var providerID: AnalyticsProviderIdentifier {
        return .firebase
    }

    var defaultEventProperties: AnalyticsDefaultEventPropertiesProtocol
    var defaultScreenProperties: AnalyticsDefaultScreenPropertiesProtocol
    
    init(defaultEventProperties: AnalyticsDefaultEventPropertiesProtocol = FirebaseDefaultEventProperties(),
         defaultScreenProperties: AnalyticsDefaultScreenPropertiesProtocol = FirebaseDefaultScreenProperties()) {
        self.defaultEventProperties = defaultEventProperties
        self.defaultScreenProperties = defaultScreenProperties
    }
    
    func logEvent(_ event: AnalyticsEventProtocol) {
        Analytics.logEvent(event.name.rawValue, parameters: event.properties?.mergeOnto(target: defaultEventProperties.properties))
    }
    
    func trackScreen(_ screen: AnalyticsScreenProtocol) {
        Analytics.logEvent(screen.name.rawValue, parameters: screen.properties?.mergeOnto(target: defaultScreenProperties.properties))
    }
    
    func setupProfileIdentification(_ profileIdentification: AnalyticsProfileIdentificationProtocol) {
        Analytics.setUserID(profileIdentification.profileID)
    }
    
    func setProfileProperties(_ properties: AnalyticsProfilePropertiesProtocol) {
        for (key,value) in properties.properties {
            Analytics.setUserProperty("\(value)", forName: key)
        }
    }
}

