//
//  AdvertDetailPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

final class AdvertDetailPresenter {
    weak var view : PresenterToViewAdvertDetailProtocol?
    private var router : PresenterToRouterAdvertDetailProtocol
    init(view: PresenterToViewAdvertDetailProtocol?,router:PresenterToRouterAdvertDetailProtocol) {
        self.view = view
        self.router = router
    }
}


//MARK: ViewToPrensenterAdvertDetailProtocol
extension AdvertDetailPresenter : ViewToPrensenterAdvertDetailProtocol {

    
    func packageSegmentedConrollerChanged(index: Int) {
        print(index)
       
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color:  ColorTheme.lightBackColor.color)
        view?.changeTitle(title: TextTheme.advertDetailNav.text)
    }
    
    func onTappedSendMessageButton() {
        print("On Tapppedm message button")
        router.toMessage(view: view)
    }
}


//MARK: InteractorToPresenterAdvertDetailProtocol
extension AdvertDetailPresenter : InteractorToPresenterAdvertDetailProtocol {
    
}
