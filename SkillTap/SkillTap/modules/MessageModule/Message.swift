//
//  Message.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation

struct MessageData {
    let id:Int
    let message:String
    let messageType:MessageType
    let date:String
}

enum MessageType {
    case text
    case file
}
