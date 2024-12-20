//
//  LastMessageListRouter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit
class RoomListRouter {
    static func createModule() -> UIViewController {
        let viewController = RoomListViewController()
        let interactor = RoomListInteractor()
        let presenter : ViewToPrensenterRoomListProtocol & InteractorToPresenterRoomListProtocol =
        RoomListPresenter(view: viewController,  router: RoomListRouter(),interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}

extension RoomListRouter : PresenterToRouterRoomListProtocol {
    func toMessage(view: PresenterToViewRoomListProtocol?,id:String,nameSurname:String) {
        let viewController = MessageRouter.createModule(id: id,nameSurname: nameSurname)
        view?.pushViewControllerAble(viewController, animated: true)
    }

    
}
