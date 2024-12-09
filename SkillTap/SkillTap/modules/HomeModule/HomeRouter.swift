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
       let presenter : ViewToPrensenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter(view: viewController, router: router)
       viewController.presenter = presenter
        return viewController
    }
}


extension HomeRouter : PresenterToRouterHomeProtocol {

    func toSearchView(view: PresenterToViewHomeProtocol?) {
        let viewController = SearchRouter.createSearchModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toSubCategoryView(view: PresenterToViewHomeProtocol?) {
        let viewController = SubCategoryRouter.createSubCategoryModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toLastMessageList(view: PresenterToViewHomeProtocol?) {
        let viewController = LastMessageListViewController()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
}
