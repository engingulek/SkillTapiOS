//
//  AdvertInfoView.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
import SnapKit
class AdvertDetailInfoView : UIView {
    private lazy var advertOwnerProfilImage : UIImageView = UIImageView()
    private lazy var advertOwnerUsername : UILabel = UILabel.middleTitleLabel()
    private lazy var advertOwnerSubtitle:  UILabel = UILabel.lightMiddleLabel()
    private lazy var descLabel : UILabel = UILabel.descUILabel(lineLimit: .zero)
    private lazy var descTitleLabel : UILabel = UILabel.middleTitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
     
       
        backgroundColor = .white
        layer.cornerRadius = CornerRadiusTheme.small.rawValue
        descTitleLabel.text = "Advert Description"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView(){
        addSubview(advertOwnerProfilImage)
        advertOwnerProfilImage.layer.cornerRadius = 80 / 2
        advertOwnerProfilImage.contentMode = .scaleAspectFill
        advertOwnerProfilImage.clipsToBounds = true
        advertOwnerProfilImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
            make.size.equalTo(80)
           
        
            
        }
        
        addSubview(advertOwnerUsername)
        advertOwnerUsername.snp.makeConstraints { make in
            make.leading.equalTo(advertOwnerProfilImage.snp.trailing).offset(10)
            make.top.equalTo(advertOwnerProfilImage.snp.top)
           
        }
        addSubview(advertOwnerSubtitle)
        advertOwnerSubtitle.snp.makeConstraints { make in
            make.leading.equalTo(advertOwnerProfilImage.snp.trailing).offset(10)
            make.top.equalTo(advertOwnerUsername.snp.bottom).offset(5)
        }
        
       addSubview(descTitleLabel)
        descTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(advertOwnerProfilImage.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
          
          
          
        }
        
        addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
             make.top.equalTo(descTitleLabel.snp.bottom).offset(5)
             make.leading.equalToSuperview().offset(20)
             make.bottom.equalToSuperview().offset(-25)
            make.trailing.equalToSuperview().offset(-20)
           
         }
        
    }
    
    func configureData(freelancer:FreelancerOnAdvertDetail){
        advertOwnerProfilImage.setImageWithKigfisher(with: freelancer.imageURL)
        advertOwnerUsername.text = freelancer.title
        advertOwnerSubtitle.text = freelancer.subTitle
        
        descLabel.text = freelancer.detail
       
    }
}
