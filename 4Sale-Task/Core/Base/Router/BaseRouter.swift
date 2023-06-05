//
//  BaseRouter.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 01/03/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import Foundation
import UIKit

protocol BaseRouterProtocol {
    func showCameraPermissionAlertDenied()
    func showCameraCaptureError()
}

extension BaseRouterProtocol {
    func showCameraPermissionAlertDenied() {
        let alertController = UIAlertController(title: "Camera Permissions Denied", message: "Camera permissions have been denied for this app. You can change this by going to Settings", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        UIApplication.getTopViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    func showCameraCaptureError() {
        let alert = UIAlertController(title: "Camera Configuration Failed", message: "There was an error while configuring camera.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.getTopViewController()?.present(alert, animated: true, completion: nil)
    }
}

