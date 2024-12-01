//
//  BannerView.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit

class BannerView  : UIView{
    
    private lazy var bannerLabel : UILabel = UILabel.middleTitleLabel()
    private lazy var bannerImage : UIImageView = UIImageView()
    private lazy var bannerSubTitle : UILabel = UILabel.smallLabelLignt()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView(){
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
    
        
        self.addSubview(bannerImage)
        bannerImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.size.equalTo(100)
        }
        
        self.addSubview(bannerLabel)
        bannerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bannerImage.snp.bottom).offset(10)
        }
        
        self.addSubview(bannerSubTitle)
        bannerSubTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bannerLabel.snp.bottom).offset(10)
        }
    }
    
    
     func setBannerCongigure(
        text:String,
        bannerImageUrl:String,
        bannerSubText:String
     ){
        bannerLabel.text = text
        bannerImage.setImageWithKigfisher(with: bannerImageUrl)
         bannerSubTitle.text = bannerSubText
    }
    
    
    
}
