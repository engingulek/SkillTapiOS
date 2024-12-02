//
//  UIButton+Extensions.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import Foundation
import UIKit.UIButton
extension UIButton {
    static func basicButton(action:UIAction) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addAction(action, for: .touchUpInside)
        return button
    }
}