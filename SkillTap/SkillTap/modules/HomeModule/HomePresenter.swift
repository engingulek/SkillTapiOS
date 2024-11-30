//
//  HomePresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

final class HomePresenter {
    weak var view: PresenterToViewHomeProtocol?
    init(view: PresenterToViewHomeProtocol?) {
        self.view = view
    }
    
}


//MARK: ViewToPrensenterHomeProtocol
extension HomePresenter : ViewToPrensenterHomeProtocol {

    
    func viewDidLoad() {
        view?.setBackColorAble(color:ColorTheme.appBackColor.color)
        view?.setConfigureView(searchLigtLabelText: "What do you need?")
    }
    
    func onTappedSearchBar() {
        print("on tapped")
    }

}

//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter : InteractorToPresenterHomeProtocol {
    
}
