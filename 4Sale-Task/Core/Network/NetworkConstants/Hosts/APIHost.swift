//
//  APIHost.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 09/05/2021.
//

import Foundation

/// The Identifiers of the different base urls which is used across the whole app
enum HOST {
    case defaultBase
}

/// Adding the default base url 
extension HOST {

    /// based on the target environment setting the base url
    private var baseString: String? {
        switch self {
        case .defaultBase:
            return  "myfawrykyc.fawrystaging.com"//try? Configuration.value(for: .baseURL)
        }
    }

    /// setting the base url by confirming the protocol attribute
    var baseUrl: String {
        guard let baseString = baseString
        else {
            fatalError("Empty Base String, Please add the DEFAULT_BASE_URL key to the configurations files")
        }
        return "https://" + baseString + ":8035/"
    }
}
