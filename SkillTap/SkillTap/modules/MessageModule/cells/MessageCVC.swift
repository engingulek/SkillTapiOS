//
//  SentMessageCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit
import SnapKit
class MessageCVC: UICollectionViewCell {
    static  let identifier : String  = "sentMessageCellIdentifier"
    private lazy var textMessage:UILabel = UILabel.cellTitleUILabel(color: ColorTheme.secondaryColor.color)
    private lazy var docDowloadAbleImage : UIImageView = UIImageView.docDowloadAbleIcon()
    private let bubbleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CornerRadiusTheme.xsmall.rawValue
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
    }

    private func configureView(){
        addSubview(bubbleView)
        bubbleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)

            make.bottom.equalToSuperview().offset(-5)
        }
       
    }
    
    func changeViewAccordindMessagePostion(messagePositon:MessagePositonType,
                                           backColor:String){
        switch messagePositon {
        case .sender:
            bubbleView.backgroundColor = UIColor(hex: backColor)
            bubbleView.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(15)
            }
        case .receiver:
            bubbleView.backgroundColor = UIColor(hex: backColor)
            bubbleView.snp.remakeConstraints { make in
                make.trailing.equalToSuperview().offset(-15)
            }
        }
    }
    
    func configureData(message:MessageData){
        textMessage.text = message.message
    }
    
    func convertMessageType(messageType:MessageType) {
        switch messageType {
        case .text:
            bubbleView.addSubview(textMessage)
            textMessage.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(5)
                make.leading.equalToSuperview().offset(15)
                make.bottom.equalToSuperview().offset(-5)
                make.trailing.equalToSuperview().offset(-15)
            }
        case .file:
            bubbleView.addSubview(docDowloadAbleImage)
            docDowloadAbleImage.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(5)
                make.leading.equalToSuperview().offset(15)
                make.bottom.equalToSuperview().offset(-5)
                make.trailing.equalToSuperview().offset(-15)
                make.size.equalTo(50)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
