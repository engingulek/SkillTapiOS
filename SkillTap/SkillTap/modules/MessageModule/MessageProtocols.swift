//
//  MessageProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation


typealias MesssageKits = UIViewAble & NavConUIAble

//MARK: ViewToPrensenterMessageProtocol
protocol ViewToPrensenterMessageProtocol{
    var view : PresenterToViewMessageProtocol? {get}
    func viewDidLoad()
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath) ->  (position:MessagePositonType,
                                                  messageData:MessageResponse,
                                                  messageType:MessageType,
                                                  backColor:String)
    func sizeForItemAt(width:CGFloat,
                       height:CGFloat) -> CGSize
    
    func getRoomId(id:String,nameSurname:String)
    

    
    
}

//MARK: PresenterToViewMessageProtocol
protocol PresenterToViewMessageProtocol : AnyObject,MesssageKits{
 
    func messageCollectionViewPrepare()
    func messageCollectionViewRealoaData()

    
}

//MARK: PresenterToInteractorMessageProtocol
protocol PresenterToInteractorMessageProtocol {
    func fetchMessage(id:String)
}

//MARK: InteractorToPresenterMessageProtocol
protocol InteractorToPresenterMessageProtocol{
    func sendMessageList(messageList:[MessageResponse])
}

//MARK: PresenterToRouterSubCategoryProtocol
protocol PresenterToRouterMessageProtocol {
    
}
