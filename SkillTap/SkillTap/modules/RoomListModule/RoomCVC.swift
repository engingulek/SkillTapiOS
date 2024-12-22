//
//  LastMessageCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class RoomCVC: UICollectionViewCell {
    static  let identifier : String  = "roomcvcIndentifier"
    private lazy var userImage : UIImageView = UIImageView()
    private lazy var userName = LabelFactory.createLabel(ofType: .cellTitleUILabel())
    private lazy var lastMessageLabel = LabelFactory.createLabel(ofType: .lightMiddleLabel)
    private lazy var dateLabel  = LabelFactory.createLabel(ofType: .lightMiddleLabel)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userImage.backgroundColor  = .black
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        
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
    
    func configureData(room:RoomResponse){
        userImage.setImageWithKigfisher(with: room.userImageUrl)
        userName.text = room.userName
        lastMessageLabel.text = room.lastMessage
        let date = convertDate(times: room.date)
        dateLabel.text = date
    }
    
    
    private func convertDate(times:Int) -> String{
        let calendar = Calendar.current
        let messageDate =  Date(timeIntervalSince1970: TimeInterval(times))
        let component = calendar.dateComponents([.day], from: messageDate, to: Date.now)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let messageDateFormatter = dateFormatter.string(from: messageDate)
        let dayDif = component.day ?? -1
       
        switch dayDif {
        case 0:
            return "Today"
        case 1:
            return "Yesterday"
        default:
            return messageDateFormatter
            
        }
    }
    
}
