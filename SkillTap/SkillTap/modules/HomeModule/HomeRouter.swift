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
        return viewController
    }
}


extension HomeRouter : PresenterToRouterHomeProtocol {
    func toSearchView(view: PresenterToViewHomeProtocol?) {
        let viewController = SearchRouter.createSearchModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
}
