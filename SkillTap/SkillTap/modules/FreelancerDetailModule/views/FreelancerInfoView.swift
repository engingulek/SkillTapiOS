//
//  FreelancerInfoView.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
import SnapKit
class FreelancerInfoView : UIView {
    private lazy var freelancerProfilImage : UIImageView = UIImageView()
    private lazy var freelancerTitle : UILabel = UILabel.middleTitleLabel()
    private lazy var ratingImage : UIImageView = UIImageView.ratingImage()
    private lazy var ratingLabel : UILabel = UILabel.middleTitleLabel(color: ColorTheme.ratingColor.color)
    private lazy var descLabel : UILabel = UILabel.descUILabel(lineLimit: 5)
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        backgroundColor = .white
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView(){
        addSubview(freelancerProfilImage)
        freelancerProfilImage.layer.cornerRadius = 80 / 2
        freelancerProfilImage.contentMode = .scaleAspectFill
        freelancerProfilImage.clipsToBounds = true
        freelancerProfilImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.size.equalTo(80)
            
        }
        
        addSubview(freelancerTitle)
        freelancerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(freelancerProfilImage.snp.bottom).offset(10)
           
        }
        
        
        addSubview(ratingImage)
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
        }
        
    }
    
    func configureData(){
        freelancerProfilImage.setImageWithKigfisher(with: "https://images.unsplash.com/photo-1665686310934-8fab52b3821b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        freelancerTitle.text = "usernamae"
        ratingLabel.text = "4.5"
        descLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    }
    
    
}
