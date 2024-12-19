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
    private lazy var freelancerSubTitle : UILabel = UILabel.lightMiddleLabel()
    private lazy var ratingImage : UIImageView = UIImageView.ratingImage()
    private lazy var ratingLabel : UILabel = UILabel.middleTitleLabel(color: ColorTheme.ratingColor.color)
    private lazy var descLabel : UILabel = UILabel.descUILabel(lineLimit: 5)
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        backgroundColor = .white
        layer.cornerRadius = CornerRadiusTheme.small.rawValue
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
        
        addSubview(freelancerSubTitle)
        freelancerSubTitle.snp.makeConstraints { make in
            make.top.equalTo(freelancerTitle.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        
        addSubview(ratingImage)
        ratingImage.snp.makeConstraints { make in
            
            make.top.equalTo(freelancerSubTitle.snp.bottom).offset(5)
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
    
    func configureData(freelancer:FreelancerDetail){
        freelancerProfilImage.setImageWithKigfisher(with: freelancer.imageURL)
        freelancerTitle.text = freelancer.title
        freelancerSubTitle.text = freelancer.subTitle
        ratingLabel.text = "\(freelancer.rating)"
        descLabel.text = freelancer.detail
        
        
    }
}
