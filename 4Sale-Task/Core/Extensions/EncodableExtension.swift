//
//  EncodableExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

extension Encodable {
    
    /// Converting object to post dictionary
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data, options: [])
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
    
    /// Converting object to JSON format
    func toJsonString(_ encoder: JSONEncoder = JSONEncoder()) -> String? {
        do {
            if let jsonData = try? encoder.encode(self) {
                let json = String(data: jsonData, encoding: String.Encoding.utf8)
                return json
            }
        }
        return nil
    }
    
    func getParameters() -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try encoder.encode(self)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                //                print(jsonString)
                return try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] ?? ["": ""]
            }
        } catch {
            print(error.localizedDescription)
        }
        return [:]
    }
}

extension Decodable {
    init(from: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}
