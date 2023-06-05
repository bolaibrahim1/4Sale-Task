//
//  CommonAlertsProtocol.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

/// Defines the common alerts for any view
protocol CommonAlertsProtocol {
    
    /// Show the no internet connection error view
    func showNoInternetConnectionError()
    
    /// Hide the no internet connection error view
    func hideNoInternetConnectionError()
    
    /// Show server error view
    func showServerError()
    
    /// Hide server error view
    func hideServerError()
}
