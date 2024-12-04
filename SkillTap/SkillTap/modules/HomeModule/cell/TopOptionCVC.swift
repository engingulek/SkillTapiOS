//
//  TopOptions.swift
//  SkillTap
//
//  Created by Engin Gülek on 1.12.2024.
//

import UIKit

class TopOptionCVC: UICollectionViewCell {
    static  let identifier : String  = "topOptionCellIdentifier"
    
    private lazy var titleLabel = UILabel.cellTitleUILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = RadiusTheme.smallRadius.radius
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func setItem(text:String,borderColor:String,textColor:String){
        titleLabel.text = text
        contentView.layer.borderColor = UIColor(hex: borderColor)?.cgColor
        titleLabel.textColor = UIColor(hex: textColor)
        
    }
    
}
