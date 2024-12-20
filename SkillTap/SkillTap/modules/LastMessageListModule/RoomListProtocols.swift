//
//  LastMessageListProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation


typealias RoomListKits = UIViewAble & NavConUIAble & SegueAble

//MARK: ViewToPrensenterLastMessageListProtocol
protocol ViewToPrensenterRoomListProtocol{
    var view : PresenterToViewRoomListProtocol? {get}
    func viewDidLoad()
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath) -> RoomResponse
    func didSelectItem(at indexPath:IndexPath)
    func sizeForItemAt(width:CGFloat,
                       height:CGFloat) -> CGSize
    

    
    
}

//MARK: PresenterToViewRoomListProtocol
protocol PresenterToViewRoomListProtocol: AnyObject,RoomListKits{
 
    func roomListCollectionViewPrepare()
    func roomListCollectionViewRealoaData()

    
}

//MARK: PresenterToInteractorRoomListProtocol
protocol PresenterToInteractorRoomListProtocol {
    func fetchRoomList(id:String)
}

//MARK: InteractorToPresenterRoomListProtocol
protocol InteractorToPresenterRoomListProtocol{
    func sendRoomList(roomList:[RoomResponse])
}

//MARK: PresenterToRouterRoomListProtocol
protocol PresenterToRouterRoomListProtocol{
    func toMessage(view:PresenterToViewRoomListProtocol?)
}
