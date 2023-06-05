//
//  BaseViewControllerProtocol.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import UIKit

/// Defines the base interface requirements for any view controller classes
protocol BaseViewControllerProtocol: CommonAlertsProtocol {
    
    /// Starting animating the loading indicator
    func startLoadingIndicator()
    
    /// Stop animating the loading indicator
    func stopLoadingIndicator()

}

/// Extension to add Default implementation to BaseViewControllerProtocol
extension BaseViewControllerProtocol where Self: UIViewController {}
