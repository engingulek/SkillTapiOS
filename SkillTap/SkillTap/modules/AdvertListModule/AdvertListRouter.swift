//
//  AdvertListRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit
class AdvertListRouter {
    static func createModule() -> UIViewController {
        let viewController = AdvertListViewController()
        let presenter : ViewToPrensenterAdvertListProtocol
        & InteractorToPresenterAdvertListProtocol = AdvertListPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
