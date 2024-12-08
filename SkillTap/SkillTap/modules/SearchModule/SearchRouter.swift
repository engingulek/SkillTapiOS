//
//  SearchRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import Foundation
import UIKit

class SearchRouter {
    static func createSearchModule() -> UIViewController {
        let viewController = SearchViewController()
        let router = SearchRouter()
        let presenter : ViewToPrensenterSearchProtocol & InteractorToPresenterSearchProtocol = SearchPresenter(view: viewController,router:router)
        viewController.presenter = presenter
        return viewController
    }
}


extension SearchRouter : PresenterToRouterSearchProtocol {
    func toFreelancerDetail(view: PresenterToViewSearchProtocol?) {
        let viewController = FreelancerDetailViewController()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toAdvertDetail(view: PresenterToViewSearchProtocol?) {
        let viewController = AdvertDetailRouter.createSearchModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
