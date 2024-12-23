//
//  HomeRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit

class HomeRouter {
   static func createHomeModule() -> UIViewController {
        let viewController = HomeViewController()
       let router = HomeRouter()
       let interactor = HomeInteractor()
       let presenter : ViewToPrensenterHomeProtocol & InteractorToPresenterHomeProtocol
       = HomePresenter(view: viewController,
                       router: router,
       interactor: interactor)
       viewController.presenter = presenter
       interactor.presenter = presenter
        return viewController
    }
}

extension HomeRouter : PresenterToRouterHomeProtocol {

    func toSearchView(view: PresenterToViewHomeProtocol?) {
        let viewController = SearchRouter.createSearchModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toRoomList(view: PresenterToViewHomeProtocol?) {
        let viewController = RoomListRouter.createModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
}
