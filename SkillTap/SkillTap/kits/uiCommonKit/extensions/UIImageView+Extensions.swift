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
    
    static func magnifyingglassIcon() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = .init(systemName: "magnifyingglass")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        return imageView
    }
    
    static func docDowloadAbleIcon() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = .init(systemName: "arrow.down.doc.fill")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        return imageView
    }
    
    static func messageBubbleIcon() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = .init(systemName: "message.fill")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        return imageView
    }
    
    static func ratingImage() -> UIImageView{
        let imageView = UIImageView()
        let color : UIColor = UIColor(hex: ColorTheme.ratingColor.color) ?? .orange
        imageView.image = .init(systemName: "star.fill")?
            .withTintColor(color, renderingMode: .alwaysOriginal)
        return imageView
       
    }
    
    static func errorIcon() -> UIImageView{
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = .init(resource: .errorIcon)
        imageView.isHidden = true
        return imageView
    
    }
    
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
