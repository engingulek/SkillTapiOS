//
//  Room.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation
import Firebase

struct RoomResponse: Decodable {
    let id:String
    let userName:String
    let date: Int
    let userImageUrl: String
    let lastMessage: String

}
