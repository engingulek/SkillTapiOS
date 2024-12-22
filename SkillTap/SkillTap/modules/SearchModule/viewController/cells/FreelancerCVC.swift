//
//  FreelancerCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import UIKit
import SnapKit

class FreelancerCVC: UICollectionViewCell {
    static let identifier : String  = "freelancerCellIdenfier"
    private lazy var freelancerImage : UIImageView = UIImageView()
    private lazy var freelancerTitleLabel = LabelFactory.createLabel(ofType: .cellTitleUILabel())
    private lazy var freelancerSubTitleLabel  = LabelFactory.createLabel(ofType: .lightMiddleLabel)
    private lazy var freelancerDescLabel = LabelFactory.createLabel(ofType: .descUILabel())
    private lazy var ratingImage = IconFactory.createIcon(ofType: .rating)
    private lazy var ratingLabel  = LabelFactory.createLabel(ofType: .middleTitleLabel(ColorTheme.ratingColor.color))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = CornerRadiusTheme.small.rawValue
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView(){
        contentView.addSubview(freelancerImage)
        freelancerImage.layer.cornerRadius = 60 / 2
        freelancerImage.clipsToBounds = true
        freelancerImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(60)
        }
        
        contentView.addSubview(freelancerTitleLabel)
        freelancerTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(freelancerImage.snp.top)
            make.leading.equalTo(freelancerImage.snp.trailing).offset(5)
        }
        
        contentView.addSubview(freelancerSubTitleLabel)
        freelancerSubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(freelancerTitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(freelancerImage.snp.trailing).offset(5)
        }
        
        contentView.addSubview(freelancerDescLabel)
        freelancerDescLabel.snp.makeConstraints { make in
            make.top.equalTo(freelancerImage.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        contentView.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(freelancerTitleLabel.snp.top)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        contentView.addSubview(ratingImage)
        ratingImage.snp.makeConstraints { make in
            make.top.equalTo(freelancerTitleLabel.snp.top)
            make.trailing.equalTo(ratingLabel.snp.leading).offset(-1)
        }
        
    }
    
    func configureData(freelancer:Freelancer){
       freelancerImage.setImageWithKigfisher(with: freelancer.imageURL)
      
        freelancerTitleLabel.text = freelancer.title
        freelancerSubTitleLabel.text = freelancer.subTitle
        freelancerDescLabel.text = freelancer.detail
        ratingLabel.text = "\(freelancer.rating)"
    }
}
