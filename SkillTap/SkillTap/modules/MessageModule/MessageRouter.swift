//
//  MessageRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit

class MessageRouter {
    static func createModule(id:String,nameSurname:String) -> UIViewController {
        let viewController = MesssageViewController()
        let interactor = MessageInteractor()
        let presenter : ViewToPrensenterMessageProtocol
        & InteractorToPresenterMessageProtocol = MessagePresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.getRoomId(id: id,nameSurname: nameSurname)
        return viewController
    }
}
