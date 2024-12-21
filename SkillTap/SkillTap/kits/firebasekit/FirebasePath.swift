//
//  FirebasePath.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation
import FirebaseDatabase
import Firebase


protocol FirebaseTargetType{
  
    var path:DatabaseReference {get}
}


enum FirebasePath {
    case rooms(String)
    case messages(String)
}


extension FirebasePath : FirebaseTargetType {
    
    
    var path: DatabaseReference {
        switch self {
        case .rooms(let userId):
            return Database.database().reference().child("rooms").child("\"\(userId)\"")
        case .messages(let roomId):
            return Database.database().reference().child("messages").child(roomId)
        }
    }
}


enum FirebaseSetPath {
    case room(String)
    case updateRoom(String,String)
}


extension FirebaseSetPath : FirebaseTargetType {
    var path: DatabaseReference {
        switch self {
        case .room(let roomId):
            return Database.database().reference().child("messages").child(roomId).childByAutoId()
        case .updateRoom(let userId,let roomId):
            return Database.database().reference().child("rooms").child("\"\(userId)\"").child(roomId)
        }
    }
    
    
}
