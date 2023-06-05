//
//  AnalyticsScreenPropertiesProtocol.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 25/05/2021.
//  Copyright © 2021 Arabian Systems. All rights reserved.
//

import Foundation

/// The interface which contains all the default parameters and properties for an analytics event
protocol AnalyticsDefaultScreenPropertiesProtocol {
    
    /// The default properties of an Event
    var properties: AnalyticsProperties { get }
}
