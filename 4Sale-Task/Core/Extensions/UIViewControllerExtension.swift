//
//  UIViewControllerExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 04/04/2022.
//  Copyright © 2022 myFawry. All rights reserved.
//

import Foundation
import UIKit

enum PresentType {
    case push
    case present
}

extension UIViewController {
    
    // MARK:- Navigate to ViewController
    func startVC(vc: UIViewController, with presentType: PresentType = .push, presentStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = false) {
        if presentType == .push {
            self.navigationController?.pushViewController(vc, animated: animated)
        } else if presentType == .present {
            vc.modalPresentationStyle = presentStyle
            self.present(vc, animated: animated, completion: nil)
        }
    }
    
    func back(animated: Bool = false){
        if let navigationController = self.navigationController {
            _ = navigationController.popViewController(animated: animated)
        } else {
            self.dismiss(animated: animated, completion: nil)
        }
    }
}

