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
    
    func configureData(){
        titleLabel.text = "Test Title"
        advertImage.setImageWithKigfisher(with: "https://images.unsplash.com/photo-1620969427101-7a2bb6d83273?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        priceInfoLabel.text = "250 TL"
        detailLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    }
}
