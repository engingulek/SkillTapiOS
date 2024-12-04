//
//  CategoryCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    static  let identifier : String  = "categoryCellIdentifier"
    
    
    private lazy var bannerLabel : UILabel = UILabel.middleTitleLabel(
        color: ColorTheme.secondaryColor.color)
    private lazy var bannerImage : UIImageView = UIImageView()
    private lazy var bannerSubTitleDeveloper : UILabel = UILabel.xSmallLabelLignt(
        color: ColorTheme.secondaryColor.color)
    private lazy var bannerSubTitleFreelancer : UILabel = UILabel.xSmallLabelLignt(
        color: ColorTheme.secondaryColor.color)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(){
        self.layer.cornerRadius = 20
      
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
        
        self.addSubview(bannerSubTitleDeveloper)
        bannerSubTitleDeveloper.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bannerLabel.snp.bottom).offset(10)
        }
        
        addSubview(bannerSubTitleFreelancer)
        bannerSubTitleFreelancer.snp.makeConstraints { make in
            make.top.equalTo(bannerSubTitleDeveloper.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    
    func setBannerCongigure(){
        bannerLabel.text = "Title"
        bannerImage.setImageWithKigfisher(with: "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/skillTap%2Fcoding.png?alt=media&token=6741ab68-bcb2-4c17-afd8-d8c18c74359d")
        bannerSubTitleFreelancer.text = "23.000 Freelancer"
        bannerSubTitleDeveloper.text = "10.000 Developer"
        layer.backgroundColor = UIColor.red.cgColor
        layer.borderColor =  UIColor.red.cgColor
    }
    
    

}
