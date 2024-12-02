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

      let presenter : ViewToPrensenterSearchProtocol & InteractorToPresenterSearchProtocol = SearchPresenter(view: viewController)
      viewController.presenter = presenter
       return viewController
    }
}
