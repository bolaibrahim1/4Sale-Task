//
//  CollectionViewExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 24/03/2022.
//  Copyright © 2022 myFawry. All rights reserved.
//

import UIKit


extension UICollectionView {

    func registerCell<T: UICollectionViewCell>(type: T.Type) {
        register(type.nib, forCellWithReuseIdentifier: String(describing: T.self))
    }

    func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self),
                                                  for: indexPath) as? T else {
            fatalError("Couldn't find nib file for \(String(describing: T.self))")
        }
        return cell
    }

}

