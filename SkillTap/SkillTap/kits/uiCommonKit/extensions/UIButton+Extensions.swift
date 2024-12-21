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
        button.layer.cornerRadius = CornerRadiusTheme.small.rawValue
        button.layer.borderWidth = 1
        button.addAction(action, for: .touchUpInside)
        return button
    }
    
    static func messageButton(action:UIAction) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = CornerRadiusTheme.small.rawValue
        button.setTitle(TextTheme.sendMessage.text, for: .normal)
        button.backgroundColor = UIColor(hex: ColorTheme.thirdColor.color)
        button.setTitleColor(UIColor(hex: ColorTheme.secondaryColor.color), for: .normal)
        button.addAction(action, for: .touchUpInside)
        return button
    }
    
    
    static func arrowMessageButton(action:UIAction) -> UIButton {
        let button =  UIButton(type: .system)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
        let symbolImage = UIImage(systemName: "arrowtriangle.forward.square.fill", withConfiguration: symbolConfig)
        button.setImage(symbolImage, for: .normal)
        button.tintColor = UIColor(hex: ColorTheme.thirdColor.color)
        button.addAction(action, for: .touchUpInside)
        return button
    }
}
