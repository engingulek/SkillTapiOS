//
//  SentMessageCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class SentMessageCVC: UICollectionViewCell {
    static  let identifier : String  = "sentMessageCellIdentifier"
    private lazy var textMessage:UILabel = UILabel.cellTitleUILabel(color: ColorTheme.secondaryColor.color)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textMessage.text = "message"
        textMessage.backgroundColor = .black
        textMessage.layer.cornerRadius = 5
        textMessage.clipsToBounds = true
        configureView()
        
    }
    
    
    private func configureView(){
        addSubview(textMessage)
        textMessage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
