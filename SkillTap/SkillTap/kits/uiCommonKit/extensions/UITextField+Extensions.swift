//
//  UITextField+Extensions.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit.UITextField
extension UITextField {
    static func searchTextField() -> UITextField {
        let textField = UITextField()
        textField.textColor = UIColor(hex: ColorTheme.primaryTextColor.color)
        textField.font = .systemFont(ofSize: 18)
        return textField
    }
}
