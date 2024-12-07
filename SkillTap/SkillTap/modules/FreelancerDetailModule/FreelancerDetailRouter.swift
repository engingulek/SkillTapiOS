//
//  FreelancerDetailRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
class FreelancerDetailRouter {
    static func createSearchModule() -> UIViewController {
        let viewController = FreelancerDetailViewController()
        let presenter : ViewToPrensenterFreelancerDetailProtocol & InteractorToPresenterFreelancerDetailProtocol = FreelancerDetailPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
     }
}
