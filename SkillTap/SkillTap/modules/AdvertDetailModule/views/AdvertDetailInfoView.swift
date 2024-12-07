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
     
        configureData()
        backgroundColor = .white
        layer.cornerRadius = 10
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
        
        /*addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
           
        }*/
        
        
      /*  addSubview(ratingImage)
        ratingImage.snp.makeConstraints { make in
         
            make.top.equalTo(freelancerTitle.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        
        }
        
        addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
          
        }
        
        addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.top.equalTo(ratingLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }*/
        
    }
    
    func configureData(){
        advertOwnerProfilImage.setImageWithKigfisher(with: "https://images.unsplash.com/photo-1665686310934-8fab52b3821b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        advertOwnerSubtitle.text = "gg"
        advertOwnerUsername.text = "usernamae"
        descLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
       
    }
}
