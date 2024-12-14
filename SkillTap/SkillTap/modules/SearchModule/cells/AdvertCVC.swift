//
//  AdvertCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import UIKit
import SnapKit
class AdvertCVC: UICollectionViewCell {
    static let identifier : String  = "advertCellIdentifier"
    private lazy var advertImage : UIImageView = UIImageView()
    private lazy var titleLabel : UILabel = UILabel.cellTitleUILabel()
    private lazy var priceInfoLabel : UILabel = UILabel.bigPriceInfoLabel()
    private lazy var detailLabel : UILabel = UILabel.descUILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .white
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(){
        contentView.addSubview(advertImage)
        advertImage.layer.cornerRadius = 10
        advertImage.clipsToBounds = true
        advertImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.size.equalToSuperview().multipliedBy(0.5)
         
        }
        
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(advertImage.snp.top).offset(10)
            make.leading.equalTo(advertImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }
        
        contentView.addSubview(priceInfoLabel)
        priceInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(advertImage.snp.trailing).offset(10)
        }
        
        contentView.addSubview(detailLabel)
         detailLabel.snp.makeConstraints { make in
             make.top.equalTo(advertImage.snp.bottom)
             make.leading.equalToSuperview().offset(10)
             make.trailing.equalToSuperview().offset(-10)
             make.bottom.equalToSuperview().offset(-5)
            
         }
        
       
    }
    
    func configureData(advert:Advert){
        titleLabel.text = advert.title
        advertImage.setImageWithKigfisher(with: advert.imageURL)
        priceInfoLabel.text = "\(advert.price) TL"
        detailLabel.text = advert.detail
    }
}
