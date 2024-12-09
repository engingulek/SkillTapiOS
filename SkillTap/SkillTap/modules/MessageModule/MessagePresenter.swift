//
//  MessagePresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation

enum MessagePositonType {
    case sender
    case receiver
}

class MessagePresenter {
    weak var view : PresenterToViewMessageProtocol?
    private var messageList : [MessageData] = []
    init(view: PresenterToViewMessageProtocol?) {
        self.view = view
    }
    
    
}


extension MessagePresenter : ViewToPrensenterMessageProtocol {
 
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.messageCollectionViewPrepare()
        view?.messageCollectionViewRealoaData()
        view?.changeTitle(title: "user name")
        
        messageList = [
            .init(id: 1, message: "hi", messageType: .text, date: ""),
            .init(id: 1, message: "I want a app", messageType: .text, date: ""),
            
                .init(id: 2, message: "ok", messageType: .text, date: ""),
            .init(id: 2, message: "url", messageType: .file, date: "")
             
            
        ]
    }
    
    func numberOfItemsIn() -> Int {
        return messageList.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (position:MessagePositonType,
                                                  messageData:MessageData,
                                                  backColor:String) {
        let position:MessagePositonType
        let backColor:String
        let message = messageList[indexPath.item]
       
        if message.id == 1 {
            position = .receiver
            backColor = ColorTheme.thirdColor.color
           
        }else{
            position = .sender
            backColor = ColorTheme.primaryColor.color
        }
        return (position,message,backColor)
      
    }
    
  
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width, height:height / 18)
    }
    
    
}
