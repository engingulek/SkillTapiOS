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
    private var messages : [MessageResponse] = []
    private let interactor : PresenterToInteractorMessageProtocol
    private var roomId:String = ""

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
        interactor.fetchMessage(id: id)
        
        view?.changeTitle(title: nameSurname)
    
    }
    
    func numberOfItemsIn() -> Int {
        return messages.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (position:MessagePositonType,
                                                  messageData:MessageResponse,
                                                
                                                  backColor:String) {
        let position:MessagePositonType
        let backColor:String
        let message = messages[indexPath.item]
     
        
        position = message.userId == "1" ? .receiver : .sender
        backColor = message.userId == "1" ?
        ColorTheme.thirdColor.color : ColorTheme.primaryColor.color
        
      
       
        
        return (position,message,backColor)
      
    }
    
  
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width, height:height / 18)
    }
    
    func sendMessageAction(message: String) {
        let messageData : [String:Any] = [
            "message":message,
            "timestamp" : Int(Date.now.timeIntervalSince1970),
            "userId":"1"
        
        ]
        let roomUpdate : [String:Any] = [
            "lastMessage" : message,
            "date" :Int(Date.now.timeIntervalSince1970),
        ]
        
        interactor.sendMessage(
            roomId: roomId,
            message: messageData)
        
        interactor.updateRoom(
            userId: "1",
            roomId: "-\(roomId)",
            updateValue: roomUpdate)
      
    }
}


extension MessagePresenter : InteractorToPresenterMessageProtocol {

    func sendMessageList(messageList: [MessageResponse]) {
        messages = messageList.sorted(by: { $0.timestamp < $1.timestamp })
        view?.messageCollectionViewRealoaData()
    }
}
