//
//  FirebasePath.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation
import FirebaseDatabase
import Firebase

enum FirebasePath {
    case rooms(String)
    case messages(String)
}


extension FirebasePath : FirebaseTargetType {
    
    
    var path: DatabaseReference {
        switch self {
        case .rooms(let userId):
            return Database.database().reference().child("rooms").child("\"\(userId)\"")
        case .messages(let messageId):
            return Database.database().reference().child("messages").child(messageId)
        }
    }
}
