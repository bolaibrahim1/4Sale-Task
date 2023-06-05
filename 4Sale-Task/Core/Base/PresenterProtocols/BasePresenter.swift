//
//  BasePresenter.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

/// Defines the base requirements for any presenter classes
class BasePresenter: ViewLifeCycleProtocol {
    
    // MARK: - Life Cycle
    func viewDidLoad() {}
    
    func viewWillAppear() {}
    
    func viewDidAppear() {}
    
    func viewWillDisappear() {}
}
