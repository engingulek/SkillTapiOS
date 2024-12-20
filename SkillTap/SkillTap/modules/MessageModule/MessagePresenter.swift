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
enum MessageType {
    case file
    case text
}

class MessagePresenter {
    weak var view : PresenterToViewMessageProtocol?
    private var messages : [MessageResponse] = []
    private let interactor : PresenterToInteractorMessageProtocol

    init(view: PresenterToViewMessageProtocol?,interactor:PresenterToInteractorMessageProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension MessagePresenter : ViewToPrensenterMessageProtocol {
 
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.messageCollectionViewPrepare()
        view?.messageCollectionViewRealoaData()
    }
    
    func getRoomId(id: String,nameSurname:String) {
        if id.hasPrefix("-") {
          let  messageId = String(id.dropFirst())
            interactor.fetchMessage(id: messageId)
        }
        
        view?.changeTitle(title: nameSurname)
    
    }
    
    func numberOfItemsIn() -> Int {
        return messages.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (position:MessagePositonType,
                                                  messageData:MessageResponse,
                                                  messageType:MessageType,
                                                  backColor:String) {
        let position:MessagePositonType
        let backColor:String
        let message = messages[indexPath.item]
        let messageType: MessageType
        
        position = message.userId == "1" ? .receiver : .sender
        backColor = message.userId == "1" ?
        ColorTheme.thirdColor.color : ColorTheme.primaryColor.color
        
        messageType = message.type == "file" ? .file : .text
       
        
        return (position,message,messageType,backColor)
      
    }
    
  
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width, height:height / 18)
    }
}


extension MessagePresenter : InteractorToPresenterMessageProtocol {
    func sendMessageList(messageList: [MessageResponse]) {
        messages = messageList.sorted(by: { $0.timestamp < $1.timestamp })
        view?.messageCollectionViewRealoaData()
    }
}
