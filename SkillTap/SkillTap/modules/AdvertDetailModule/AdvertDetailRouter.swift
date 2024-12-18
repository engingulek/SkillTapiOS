//
//  AdvertDetailRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
class AdvertDetailRouter {
    static func createAdvertDetailModule(id:Int) -> UIViewController {
        let viewController = AdvertDetailViewController()
        let router = AdvertDetailRouter()
        let interactor = AdvertDetailInteractor()
        let presenter : ViewToPrensenterAdvertDetailProtocol & InteractorToPresenterAdvertDetailProtocol = AdvertDetailPresenter(
            view: viewController,router: router,interactor: interactor)
        presenter.fetchAdvertDetail(id: id)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
     }
}


extension  AdvertDetailRouter : PresenterToRouterAdvertDetailProtocol {
    func toMessage(view: PresenterToViewAdvertDetailProtocol?) {
        
    }
    
    
}
