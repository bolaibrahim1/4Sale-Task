//
//  UIColorExtension.swift
//  MyFawry
//
//  Created by Bola Ibrahim on 06/04/2022.
//  Copyright © 2022 myFawry. All rights reserved.
//

import Foundation
import UIKit

enum AssetsColor: String {
    case DarkWhite_27 // #FFFFFF 27%
    case DarkWhite_70 // #FFFFFF 70%
    case IceBlue // #99C4D6
    case MMFBackground // #F9FDFF
    case PrimaryBlack // #202020
    case PrimaryCyberYellow // #FFD400
    case PrimaryDarkGrey // #7D91A5
    case PrimarySapphireBlue // #006B99
    case PrimaryShadesBlueNCS // #3389AD
    case PrimaryShadesCadetBlueCrayola // #B1BDC9
    case PrimaryShadesColumbiaBlue // #CCE1EB
    case PrimaryShadesMaximumBlue // #66A6C2
    case PrimaryShadesVibrantAlice // #E5F0F5
    case Navy //#A8C2D0
    case TitleErrorValidationColor
    case msgValidationColorError
    case validationTitleNormal
    case msgValidationColor
}

extension UIColor {
    static func getColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? .black
    }
    
    @objc static func getColor(_ name: String) -> UIColor {
        return UIColor(named: name) ?? .black
    }
}
