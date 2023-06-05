//
//  InternalNetworkErrorProtocols.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 25/01/2022.
//  Copyright © 2022 Bola Ibrahim. All rights reserved.
//


import Foundation

/// The internal network error interface which any internal error in the code has to implement
protocol InternalNetworkErrorProtocol: Codable, Error {
    
    
    var title: String? { get set }
    
    /// The status of the network request if it's successful -> true or failed -> false
    var status: Bool? { get set }
    
    /// The internal error code
    var code: Int? { get set }
}
