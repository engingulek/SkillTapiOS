//
//  UIImageviewFactory.swift
//  SkillTap
//
//  Created by Engin Gülek on 22.12.2024.
//

import Foundation
import UIKit
enum IconType {
    case magnifyingglass
    case messageBubble
    case rating
    case error
}

struct IconFactory {
    static func createIcon(ofType type: IconType) -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        
        switch type {
        case .magnifyingglass:
            imageView.image = UIImage(systemName: "magnifyingglass")?
                .withTintColor(.black, renderingMode: .alwaysOriginal)
       
            
        case .messageBubble:
            imageView.image = UIImage(systemName: "message.fill")?
                .withTintColor(.black, renderingMode: .alwaysOriginal)
            
        case .rating:
            let ratingColor = UIColor(hex: ColorTheme.ratingColor.color) ?? .orange
            imageView.image = UIImage(systemName: "star.fill")?
                .withTintColor(ratingColor, renderingMode: .alwaysOriginal)
            
        case .error:
            imageView.image = UIImage(resource: .errorIcon)
            imageView.isHidden = true
        }
        
        return imageView
    }
}
