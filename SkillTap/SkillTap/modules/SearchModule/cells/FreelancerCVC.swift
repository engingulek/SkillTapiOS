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
    private lazy var freelancerTitleLabel : UILabel = UILabel.cellTitleUILabel()
    private lazy var freelancerSubTitleLabel : UILabel = UILabel.lightMiddleLabel()
    private lazy var freelancerDescLabel : UILabel = UILabel.descUILabel()
    private lazy var ratingImage : UIImageView = UIImageView.ratingImage()
    private lazy var ratingLabel : UILabel = UILabel.middleTitleLabel(color: ColorTheme.ratingColor.color)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 10
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
    
    func configureData(){
        freelancerImage.setImageWithKigfisher(with: "https://images.unsplash.com/photo-1665686304312-16e3a16be0ed?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        
        freelancerTitleLabel.text = "Name Surname"
        freelancerSubTitleLabel.text = "Developer,Translator "
        freelancerDescLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        ratingLabel.text = "4.5"
    }
}
