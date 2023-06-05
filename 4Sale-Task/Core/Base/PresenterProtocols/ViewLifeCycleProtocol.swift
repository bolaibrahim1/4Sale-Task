//
//  ViewLifeCycleProtocol.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

/// Defines the life cycle for any viewController
protocol ViewLifeCycleProtocol {
    
    /// Handle logic when the view loaded.
    func viewDidLoad()
    
    /// Handle logic before the view appearing.
    func viewWillAppear()
    
    /// Handle logic when the view controller did appear.
    func viewDidAppear()
    
    /// Handle logic before the view disappear.
    func viewWillDisappear()
}
