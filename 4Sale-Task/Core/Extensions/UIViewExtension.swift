//
//  UIViewExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 06/02/2022.
//  Copyright © 2022 Ehab Asaad Hanna. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadNibFromFile() {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)

        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
    }

    func setGradientBackground(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 16
        self.layer.masksToBounds = false
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
