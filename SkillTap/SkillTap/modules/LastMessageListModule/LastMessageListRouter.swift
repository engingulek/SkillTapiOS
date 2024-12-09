//
//  LastMessageListRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit
class LastMessageListRouter {
    static func createModule() -> UIViewController {
        let viewController = LastMessageListViewController()
        let presenter : ViewToPrensenterLastMessageListProtocol & InteractorToPresenterLastMessageListProtocol =  LastMessageListPresenter(view: viewController)
        viewController.presenter = presenter
        
        return viewController
    }
}

extension LastMessageListRouter : PresenterToRouterLastMessageListProtocol {
    func toMessage(view: PresenterToViewLastMessageListProtocol?) {
        
    }

    
}
