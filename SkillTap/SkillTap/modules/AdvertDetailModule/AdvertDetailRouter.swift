//
//  AdvertDetailRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
class AdvertDetailRouter {
    static func createSearchModule() -> UIViewController {
        let viewController = AdvertDetailViewController()
        let router = AdvertDetailRouter()
        let presenter : ViewToPrensenterAdvertDetailProtocol & InteractorToPresenterAdvertDetailProtocol = AdvertDetailPresenter(
            view: viewController,router: router)
        viewController.presenter = presenter
        return viewController
     }
}


extension  AdvertDetailRouter : PresenterToRouterAdvertDetailProtocol {
    func toMessage(view: PresenterToViewAdvertDetailProtocol?) {
        
    }
    
    
}
