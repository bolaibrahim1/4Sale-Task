//
//  InternetConnection.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import UIKit
import Network

class InternetConnection {
    
    static let shared = InternetConnection()

    func startListening(_ controller: UIViewController = BaseViewController(), _ reachableClosure:@escaping (ConnectionStatus) -> Void = { _ in }) {

        if #available(iOS 12.0, *) {
            let monitor = NWPathMonitor()
            let queue = DispatchQueue(label: "InternetConnectionMonitor")

            monitor.pathUpdateHandler = { pathUpdateHandler in
                if pathUpdateHandler.status == .satisfied {
                    DispatchQueue.main.async {
                        reachableClosure(.connected)
                    }

                } else {
                    DispatchQueue.main.async {
                        reachableClosure(.disConnected)
                    }
                }
            }
            monitor.start(queue: queue)
        }
    }
}

enum ConnectionStatus {
    case connected
    case disConnected
}
