//
//  UIImageView+Extensions.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit.UIImageView


extension UIImageView {
    static func middleIcon(systemName:String,tintColor:UIColor = .black) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = .init(systemName: systemName)?
            .withTintColor(tintColor, renderingMode: .alwaysOriginal)
       return imageView
    }
}
