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
                                                  messageData:MessageData,backColor:String) 
    func sizeForItemAt(width:CGFloat,
                       height:CGFloat) -> CGSize
    

    
    
}

//MARK: PresenterToViewMessageProtocol
protocol PresenterToViewMessageProtocol : AnyObject,MesssageKits{
 
    func messageCollectionViewPrepare()
    func messageCollectionViewRealoaData()

    
}

//MARK: PresenterToInteractorMessageProtocol
protocol PresenterToInteractorMessageProtocol {
    
}

//MARK: InteractorToPresenterMessageProtocol
protocol InteractorToPresenterMessageProtocol{
    
}

//MARK: PresenterToRouterSubCategoryProtocol
protocol PresenterToRouterMessageProtocol {
   
}
