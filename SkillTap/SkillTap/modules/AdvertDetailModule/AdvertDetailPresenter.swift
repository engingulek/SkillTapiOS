//
//  AdvertDetailPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

final class AdvertDetailPresenter {
    weak var view : PresenterToViewAdvertDetailProtocol?
    init(view: PresenterToViewAdvertDetailProtocol?) {
        self.view = view
    }
}


//MARK: ViewToPrensenterAdvertDetailProtocol
extension AdvertDetailPresenter : ViewToPrensenterAdvertDetailProtocol {
    func viewDidLoad() {
        view?.setBackColorAble(color:  ColorTheme.lightBackColor.color)
    }
}


//MARK: InteractorToPresenterAdvertDetailProtocol
extension AdvertDetailPresenter : InteractorToPresenterAdvertDetailProtocol {
    
}
