//
//  UIImageView+Extensions.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit.UIImageView
import UIKit
import Kingfisher

extension UIImageView {
    static func middleIcon(systemName:String,tintColor:UIColor = .black) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = .init(systemName: systemName)?
            .withTintColor(tintColor, renderingMode: .alwaysOriginal)
        return imageView
    }
    
    
    func setImageWithKigfisher(with urlString: String, placeholder: UIImage? = nil) {
        guard let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }
        
        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ],
            progressBlock: nil,
            completionHandler: {  _ in
                
            }
        )
    }
    
    
    
}
