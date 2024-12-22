//
//  CategoryCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    static  let identifier : String  = "categoryCellIdentifier"
    
    
    private lazy var categoryLabel = LabelFactory.createLabel(ofType: .middleTitleLabel(ColorTheme.secondaryColor.color))
    private lazy var categoryImage : UIImageView = UIImageView()
    private lazy var categoryAdvertCount = LabelFactory.createLabel(ofType: .xSmallLabelLignt(ColorTheme.secondaryColor.color))
    private lazy var categoryFreelancerCount = LabelFactory.createLabel(ofType: .xSmallLabelLignt(ColorTheme.secondaryColor.color))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(){
        self.layer.cornerRadius = CornerRadiusTheme.medium.rawValue
      
        self.layer.borderWidth = 1

        
        self.addSubview(categoryImage)
        categoryImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        
        self.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(categoryImage.snp.bottom).offset(10)
        }
        
        self.addSubview(categoryAdvertCount)
        categoryAdvertCount.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(categoryLabel.snp.bottom).offset(10)
        }
        
        addSubview(categoryFreelancerCount)
        categoryFreelancerCount.snp.makeConstraints { make in
            make.top.equalTo(categoryAdvertCount.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    
    func configureData(category:CategoryData){
        categoryLabel.text = category.title
        categoryImage.setImageWithKigfisher(with: category.imageURL)
        categoryFreelancerCount.text = "\(category.freelancerCount) \(TextTheme.freelancers.text)"
        categoryAdvertCount.text = "\(category.advertCount) \(TextTheme.adverts.text)"
        layer.backgroundColor = UIColor(hex: category.colorCode)?.cgColor
        layer.borderColor =  UIColor(hex: category.colorCode)?.cgColor
    }
}
