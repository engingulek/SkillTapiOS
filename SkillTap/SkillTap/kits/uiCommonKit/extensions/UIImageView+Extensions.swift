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
    func setImageWithKigfisher(with urlString: String,size:Int = 100) {
        guard let url = URL(string: urlString) else {
            self.image = UIImage(resource: .placeholder)
            return
        }
       let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: size, height: size), mode: .aspectFill)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(resource: .placeholder),
            options: [
                .processor(resizingProcessor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage,
                .memoryCacheExpiration(.seconds(1)),
                .diskCacheExpiration(.days(7))
                
            ],
            progressBlock: nil,
            completionHandler: {  _ in
                
            }
        )
    }
}
