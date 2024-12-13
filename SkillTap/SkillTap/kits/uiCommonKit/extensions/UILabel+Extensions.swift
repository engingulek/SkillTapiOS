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
        label.textColor = UIColor(hex: ColorTheme.primaryColor.color)
        return label
    }
    
    
    static func largeTitleUILabel(bold:Bool) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = bold ? .boldSystemFont(ofSize: 30) : .systemFont(ofSize: 25)
        label.textColor = UIColor(hex: ColorTheme.primaryColor.color)
        return label
    }
    
    static func lightMiddleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        return label
    }
    
    static func middleTitleLabel(color:String = ColorTheme.primaryColor.color,
                                 lineLimit:Int = .zero) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(hex: color)
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.numberOfLines = lineLimit
        label.textAlignment = .center
        return label
    }
    
    
    static func erroeLabel(
        color:String = ColorTheme.thirdColor.color
    ) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(hex: color)
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.textAlignment = .center
        return label
    }
    
    
    
    static func smallLabelLignt(color:String = ColorTheme.primaryColor.color) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(hex: color)
        label.font = .systemFont(ofSize: 18,weight: .light)
        return label
    }
    
    
    static func xSmallLabelLignt(color:String = ColorTheme.primaryColor.color) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(hex: color)
        label.font = .systemFont(ofSize: 15,weight: .light)
        return label
    }
    static func cellTitleUILabel(color:String = ColorTheme.primaryColor.color) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(hex: color)
        label.font = .systemFont(ofSize: 18,weight: .semibold)
        label.textAlignment = .center
        return label
    }
    
    static func descUILabel(lineLimit:Int = .zero) -> UILabel{
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15,weight: .light)
        label.numberOfLines = lineLimit
        return label
    }
    
    static func bigPriceInfoLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 25,weight: .semibold)
        return label
    }
}
