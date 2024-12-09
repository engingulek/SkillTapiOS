//
//  LastMessageCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class LastMessageCVC: UICollectionViewCell {
    static  let identifier : String  = "lastMessageCellIndentifier"
    private lazy var userImage : UIImageView = UIImageView()
    private lazy var userName : UILabel = UILabel.cellTitleUILabel()
    private lazy var lastMessageLabel : UILabel = UILabel.lightMiddleLabel()
    private lazy var dateLabel : UILabel = UILabel.lightMiddleLabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userImage.backgroundColor  = .red
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userName.text = "User Name"
        lastMessageLabel.text = "last message"
        dateLabel.text = "Yesterday"
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(userImage)
        userImage.layer.cornerRadius = 50 / 2
        
        userImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(50)

        }
        addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.top)
            make.leading.equalTo(userImage.snp.trailing).offset(10)
        }
        addSubview(lastMessageLabel)
        lastMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(5)
            make.leading.equalTo(userImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.top)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
}
