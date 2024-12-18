//
//  FreelancerDetailRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
class FreelancerDetailRouter {
    static func createFreelancerDetailModule(id:Int) -> UIViewController {
        let viewController = FreelancerDetailViewController()
        let interactor = FreelancerDetailInteractor()
        let presenter : ViewToPrensenterFreelancerDetailProtocol & InteractorToPresenterFreelancerDetailProtocol = FreelancerDetailPresenter(
            view: viewController,
            interactor: interactor
        )
        presenter.fetchFreelancerDetail(id: id)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
     }
}
