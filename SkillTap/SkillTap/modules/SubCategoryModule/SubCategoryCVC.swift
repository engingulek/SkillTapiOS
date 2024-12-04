//
//  SubCategoryCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import UIKit

class SubCategoryCVC: UICollectionViewCell {
    static  let identifier : String  = "subCategoryCell"
    
    private lazy var titleLabel = UILabel.cellTitleUILabel()
    private lazy var rightArrowImageView = UIImageView.middleIcon(
        systemName: "arrowtriangle.forward.fill",
        tintColor: .lightGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(rightArrowImageView)
        rightArrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.size.equalTo(30)
        }
    }
    
    func setItem(text:String){
        titleLabel.text = text
        
    }
}
