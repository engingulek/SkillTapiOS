//
//  ButtonFactory.swift
//  SkillTap
//
//  Created by Engin Gülek on 22.12.2024.
//

import Foundation
import UIKit
enum ButtonType {
    case basic(action:UIAction)
    case message(action:UIAction)
    case arrowMessage(action:UIAction)
}

struct ButtonFactory {
    static func createButton(ofType type: ButtonType) -> UIButton {
        let button = UIButton()
        switch type {
        case .basic(let action):
            button.titleLabel?.font = .systemFont(ofSize: 20)
            button.layer.cornerRadius = CornerRadiusTheme.small.rawValue
            button.layer.borderWidth = 1
            button.addAction(action, for: .touchUpInside)
        case .message(let action):
            button.titleLabel?.font = .systemFont(ofSize: 20)
            button.layer.cornerRadius = CornerRadiusTheme.small.rawValue
            button.setTitle(TextTheme.sendMessage.text, for: .normal)
            button.backgroundColor = UIColor(hex: ColorTheme.thirdColor.color)
            button.setTitleColor(UIColor(hex: ColorTheme.secondaryColor.color), for: .normal)
            button.addAction(action, for: .touchUpInside)
        case .arrowMessage(let action):
            let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
            let symbolImage = UIImage(systemName: "arrowtriangle.forward.square.fill", withConfiguration: symbolConfig)
            button.setImage(symbolImage, for: .normal)
            button.tintColor = UIColor(hex: ColorTheme.thirdColor.color)
            button.addAction(action, for: .touchUpInside)
        }
        return button
    }
}
