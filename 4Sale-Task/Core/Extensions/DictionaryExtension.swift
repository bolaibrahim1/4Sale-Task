//
//  DictionaryExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 06/02/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation

extension Dictionary where Value: Any {
    public func mergeOnto(target: [Key: Value]?) -> [Key: Value] {
        guard let target = target else { return self }
        return self.merging(target) { current, _ in current }
    }
}
