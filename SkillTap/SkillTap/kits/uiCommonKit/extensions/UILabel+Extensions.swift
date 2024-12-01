//
//  UILabel+TextField.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit.UILabel

extension UILabel {
    
    static func xltitleUILabel(bold:Bool) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = bold ? .boldSystemFont(ofSize: 30) : .systemFont(ofSize: 25)
        label.textColor = UIColor(hex: ColorTheme.primaryTextColor.color)
        return label
    }
    
    
    static func largeTitleUILabel(bold:Bool) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = bold ? .boldSystemFont(ofSize: 30) : .systemFont(ofSize: 25)
        label.textColor = UIColor(hex: ColorTheme.primaryTextColor.color)
        return label
    }
    
    static func lightMiddleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        return label
    }
    
    static func middleTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        return label
    }
    
    
    static func smallLabelLignt() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18,weight: .light)
        return label
    }
    
    static func cellTitleUILabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
}
