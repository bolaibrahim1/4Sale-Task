//
//  BaseViewController.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 30/01/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    static var statusBarIsDark: Bool = false
//    let viewConnection = NoInternetConnectionMessageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        InternetConnection.shared.startListening {  connectionStatus in
            switch connectionStatus {
            case .connected: break
                //self.view.removePopupWithView(viewConnection: self.viewConnection)
                
            case .disConnected: break
               // self.view.showPopupWithView(message: "", viewConnection: self.viewConnection)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default // BaseViewController.statusBarIsDark ? .darkContent : .lightContent
    }
    
    func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    func getTopBarHeight() -> CGFloat {
        return getStatusBarHeight() +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}

// MARK:- add extension for Base ViewController interface functionality and parameter.
extension BaseViewController: BaseViewControllerProtocol, CommonAlertsProtocol {
    
    func startLoadingIndicator() {
        // PKHUDIndicator.showProgressView()
    }
    
    func stopLoadingIndicator() {
        // PKHUDIndicator.hideProgressView()
    }
    
    func showNoInternetConnectionError() {}
    
    func hideNoInternetConnectionError() {}
    
    func showServerError() {}
    
    func hideServerError() {}
    
}

extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
