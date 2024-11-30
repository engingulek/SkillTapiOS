//
//  UILabel+TextField.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit.UILabel

extension UILabel {
    
   static func lightMiddleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        return label
    }
    
}
