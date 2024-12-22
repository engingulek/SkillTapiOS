//
//  UIActivityIndicatorView.swift
//  SkillTap
//
//  Created by Engin Gülek on 14.12.2024.
//

import Foundation
import UIKit
extension UIActivityIndicatorView {
    static public func baseActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(hex: ColorTheme.primaryColor.rawValue)
        indicator.style = .large
        return indicator
    }
}
