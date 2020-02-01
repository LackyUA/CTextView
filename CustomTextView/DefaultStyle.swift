//
//  DefaultStyle.swift
//  CustomTextView
//
//  Created by Dima Dobrovolskyy on 01.02.2020.
//  Copyright © 2020 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

enum Colors {

    static let separatorOrangeColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                return UITraitCollection.userInterfaceStyle == .dark ? #colorLiteral(red: 1, green: 0.5490196078, blue: 0, alpha: 1) : #colorLiteral(red: 0.07843137255, green: 0.09411764706, blue: 0.137254902, alpha: 1)
            }
        } else {
            return #colorLiteral(red: 0.07843137255, green: 0.09411764706, blue: 0.137254902, alpha: 1)
        }
    }()
    
    static let textViewTintColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                return UITraitCollection.userInterfaceStyle == .dark ? #colorLiteral(red: 1, green: 0.5490196078, blue: 0, alpha: 1) : .systemBlue
            }
        } else {
            return .systemBlue
        }
    }()
    
}
