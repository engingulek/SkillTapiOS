//
//  LastMessageListPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation

final class RoomListPresenter {
    weak var view : PresenterToViewRoomListProtocol?
    private var router : PresenterToRouterRoomListProtocol
    private let interactor : PresenterToInteractorRoomListProtocol
    private var rooms:[RoomResponse] = []
    init(view: PresenterToViewRoomListProtocol?,
         router : PresenterToRouterRoomListProtocol,
         interactor:PresenterToInteractorRoomListProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


//MARK: ViewToPrensenterRoomListProtocol
extension RoomListPresenter : ViewToPrensenterRoomListProtocol {
    func viewDidLoad() {
        view?.changeTitle(title: TextTheme.lastMessageList.text)
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.roomListCollectionViewPrepare()
        interactor.fetchRoomList(id:"1")
    }
    
    func numberOfItemsIn() -> Int {
        return rooms.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> RoomResponse {
        let room = rooms[indexPath.item]
        return room
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        router.toMessage(view: view)
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width, height:  height / 12)
    }
    
}

//MARK: InteractorToPresenterRoomListProtocol
extension RoomListPresenter  : InteractorToPresenterRoomListProtocol {
    func sendRoomList(roomList: [RoomResponse]) {
        rooms = roomList.sorted(by: { $0.date > $1.date })
        view?.roomListCollectionViewRealoaData()
       
    }
    
 
    
    
}
