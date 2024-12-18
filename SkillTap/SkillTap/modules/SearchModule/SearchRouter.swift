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
        let interactor = SearchInteractor()
        let presenter : ViewToPrensenterSearchProtocol & InteractorToPresenterSearchProtocol
        = SearchPresenter(view: viewController,
                          router:router,
        interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}


extension SearchRouter : PresenterToRouterSearchProtocol {
    func toFreelancerDetail(view: PresenterToViewSearchProtocol?) {
        let viewController = FreelancerDetailViewController()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toAdvertDetail(view: PresenterToViewSearchProtocol?,id:Int) {
        let viewController = AdvertDetailRouter.createAdvertDetailModule(id: id)
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
