//
//  SubCategoryRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import Foundation
import UIKit

class SubCategoryRouter  {
    static func createSubCategoryModule() -> UIViewController {
        let viewController = SubCategoryViewController()
        let presenter : ViewToPrensenterSubCategoryProtocol & InteractorToPresenterSubCategoryProtocol
         = SubCategoryPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
