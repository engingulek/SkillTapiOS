//
//  AdvertDetailPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

final class AdvertDetailPresenter {
    weak var view : PresenterToViewAdvertDetailProtocol?
    private var selectedSegmentedController : Int = 0
    init(view: PresenterToViewAdvertDetailProtocol?) {
        self.view = view
    }
}


//MARK: ViewToPrensenterAdvertDetailProtocol
extension AdvertDetailPresenter : ViewToPrensenterAdvertDetailProtocol {

    
    func packageSegmentedConrollerChanged(index: Int) {
        print(index)
        selectedSegmentedController = index
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color:  ColorTheme.lightBackColor.color)
        view?.changeTitle(title: TextTheme.advertDetailNav.text)
    }
    
    func onTappedBuyButtonOnPackage() {
        print("On Tappped \(selectedSegmentedController)")
    }
}


//MARK: InteractorToPresenterAdvertDetailProtocol
extension AdvertDetailPresenter : InteractorToPresenterAdvertDetailProtocol {
    
}
