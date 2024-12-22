//
//  UILabelFactory.swift
//  SkillTap
//
//  Created by Engin Gülek on 22.12.2024.
//

import Foundation
import UIKit
enum LabelType {
    case xltitleLabel(Bool)
    case largeTitleUILabel(Bool)
    case middleTitleLabel(String = ColorTheme.primaryColor.color,
                          Int = .zero)
    case lightMiddleLabel
    case errorLabel(String = ColorTheme.thirdColor.color)
    case smallLabelLignt(String = ColorTheme.primaryColor.color)
    case xSmallLabelLignt(String = ColorTheme.primaryColor.color)
    case cellTitleUILabel(String = ColorTheme.primaryColor.color)
    case descUILabel(Int = .zero)
    case bigPriceInfoLabel
}


struct LabelFactory {
    static func createLabel(ofType type: LabelType) -> UILabel {
        let label = UILabel()
        switch type {
            
        case .xltitleLabel(let bold):
            label.textColor = .black
            label.font = bold ? .boldSystemFont(ofSize: 30) : .systemFont(ofSize: 25)
            label.textColor = UIColor(hex: ColorTheme.primaryColor.color)
            
        case .middleTitleLabel(
            let color ,
            let lineLimit):
            label.textColor = UIColor(hex: color)
            label.font = .systemFont(ofSize: 20,weight: .semibold)
            label.numberOfLines = lineLimit
            label.textAlignment = .center
            
        case .largeTitleUILabel(let bold):
            label.font = bold ? .boldSystemFont(ofSize: 30) : .systemFont(ofSize: 25)
            label.textColor = UIColor(hex: ColorTheme.primaryColor.color)
            
        case .lightMiddleLabel:
            label.textColor = .lightGray
            label.font = .systemFont(ofSize: 18)
            
        case .errorLabel(let color):
            label.textColor = UIColor(hex: color)
            label.font = .systemFont(ofSize: 20,weight: .semibold)
            label.textAlignment = .center
            label.isHidden = true
            
        case .smallLabelLignt(let color):
            label.textColor = UIColor(hex: color)
            label.font = .systemFont(ofSize: 18,weight: .light)
            
        case .xSmallLabelLignt(let color):
            label.textColor = UIColor(hex: color)
            label.font = .systemFont(ofSize: 15,weight: .light)
            
        case .cellTitleUILabel(let color):
            label.textColor = UIColor(hex: color)
            label.font = .systemFont(ofSize: 18,weight: .semibold)
            label.textAlignment = .center
            
        case .descUILabel(let lineLimit):
            label.textColor = .black
            label.font = .systemFont(ofSize: 15,weight: .light)
            label.numberOfLines = lineLimit
            
        case .bigPriceInfoLabel:
            label.textColor = .red
            label.font = .systemFont(ofSize: 25,weight: .semibold)
        }
        
    
        return label
    }
}
