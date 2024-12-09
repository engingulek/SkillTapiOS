//
//  LastMessageListProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation


typealias LastMessageKits = UIViewAble & NavConUIAble & SegueAble

//MARK: ViewToPrensenterLastMessageListProtocol
protocol ViewToPrensenterLastMessageListProtocol{
    var view : PresenterToViewLastMessageListProtocol? {get}
    func viewDidLoad()
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath)
    func didSelectItem(at indexPath:IndexPath)
    func sizeForItemAt(width:CGFloat,
                       height:CGFloat) -> CGSize
    

    
    
}

//MARK: PresenterToViewLastMessageListProtocol
protocol PresenterToViewLastMessageListProtocol: AnyObject,LastMessageKits{
 
    func lastMessageListCollectionViewPrepare()
    func lastMessageListCollectionViewRealoaData()

    
}

//MARK: PresenterToInteractorLastMessageListProtocol
protocol PresenterToInteractorLastMessageListProtocol {
    
}

//MARK: InteractorToPresenterLastMessageListProtocol
protocol InteractorToPresenterLastMessageListProtocol{
    
}

//MARK: PresenterToRouterLastMessageListProtocol
protocol PresenterToRouterLastMessageListProtocol {
    func toMessage(view:PresenterToViewLastMessageListProtocol?)
}
