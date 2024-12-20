//
//  LastMessageInteractor.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation
import Firebase
class RoomListInteractor : PresenterToInteractorRoomListProtocol {
 
    
    var presenter : InteractorToPresenterRoomListProtocol?
    private let firebaseManager : FirebaseManagerProtocol = FirebaseManager()

    func fetchRoomList(id: String) {
      
        
        firebaseManager.fetch(target: .rooms(id)) { result in
            var roomList : [RoomResponse] = []
            switch result {
            case .success(let rooms):
                for room in rooms {
                    guard let data = room.value as? NSDictionary else {return}
                    let room = RoomResponse(
                        id: room.key,
                        userName: data["nameSurname"] as? String ?? "",
                        date: data["date"] as? Int ?? 0,
                        userImageUrl: data["userImageUrl"] as? String ?? "",
                        lastMessage: data["lastMessage"] as? String ?? "")
                    roomList.append(room)
                  
                }
                
             
                self.presenter?.sendRoomList(roomList: roomList)
              
            case .failure(let failure):
                print(failure.localizedDescription)
            }
           
        }
        
    }
   
}
