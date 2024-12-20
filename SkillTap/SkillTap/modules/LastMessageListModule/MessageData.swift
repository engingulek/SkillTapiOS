//
//  MessageData.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation

struct MessageDataa{
    var message: String
    var type: String
    var userId: Int

    init?(dictionary: [String: Any]) {
        guard let message = dictionary["message"] as? String,
              let type = dictionary["type"] as? String,
              let userId = dictionary["userId"] as? Int else {
            return nil
        }
        self.message = message
        self.type = type
        self.userId = userId
    }
}
