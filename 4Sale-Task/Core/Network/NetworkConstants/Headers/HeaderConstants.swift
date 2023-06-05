//
//  HeaderConstants.swift
//  EmiratesAuction
//
//  Created by Bola Ibrahim on 09/05/2021.
//

import Foundation

/// The Identifiers of the know headers which are being used across different systems
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptLanguage = "Accept-Language"
    case acceptEncoding = "Accept-Encoding"
    case authorization =  "Bearer"
}

/// The Identifiers of the custom headers defined specifically in the app
enum CustomHTTPHeaderField {

}

/// The different values which Content Type accepts
enum ContentType: String {
    case json = "application/json"

}
