//
//  AnalyticsProviderIdentifier.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 20/02/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

/// The Identifier of the 3rd party analytics which is used across the whole app to log or track different events and screens
enum AnalyticsProviderIdentifier: String, CaseIterable {
    case firebase
    case mixPanel
}
