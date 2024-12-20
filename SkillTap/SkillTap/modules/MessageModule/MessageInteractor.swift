//
//  MessageInteractor.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation
import Firebase
class MessageInteractor : PresenterToInteractorMessageProtocol {

    var presenter : InteractorToPresenterMessageProtocol?
    private let firebaseManager : FirebaseManagerProtocol = FirebaseManager()
    func fetchMessage(id: String) {
      
        firebaseManager.fetch(target: .messages(id)) { result in
            var messageList: [MessageResponse] = []
            switch result {
            case .success(let messages):
                for message in messages {
                    guard let data = message.value as? NSDictionary else {return}
                    let message = MessageResponse(
                        id: message.key,
                        message: data["message"] as? String ?? "",
                        type: data["type"] as? String ?? "",
                        userId: data["userId"] as? String ?? "",
                        timestamp: data["timestamp"] as? Int ?? 0
                    )
                    messageList.append(message)
                }
                self.presenter?.sendMessageList(messageList: messageList)
            case .failure(let failure):
                print(failure.localizedDescription)
            
            }
        }
        
    }
    
    
}

