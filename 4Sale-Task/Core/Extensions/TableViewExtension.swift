//
//  TableViewExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 24/03/2022.
//  Copyright © 2022 myFawry. All rights reserved.
//

import UIKit

extension UITableView {

    func registerCell<T: UITableViewCell>(type: T.Type) {
        register(type.nib, forCellReuseIdentifier: String(describing: T.self))
    }

    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) {
        register(type.nib, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }

    func dequeueReusableCell<T: UITableViewCell>(type: T.Type) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Couldn't find nib file for \(String(describing: T.self))")
        }
        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self),
                                                  for: indexPath) as? T else {
            fatalError("Couldn't find nib file for \(String(describing: T.self))")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) -> T {
        guard let headerFooterView = self
            .dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Couldn't find nib file for \(String(describing: T.self))")
        }
        return headerFooterView
    }

}
