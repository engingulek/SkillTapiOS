//
//  FreelancerPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

final class FreelancerPresenter {
    weak var view : PresenterToViewFreelancerProtocol?
    init(view: PresenterToViewFreelancerProtocol?) {
        self.view = view
    }
}


//MARK: ViewToPrensenterFreelancerProtocol
extension FreelancerPresenter : ViewToPrensenterFreelancerProtocol {
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.lightBackColor.color)
        view?.changeTitle(title: TextTheme.freelancerDetail.text)
    }

}


//MARK: InteractorToPresenterFreelancerProtocol
extension FreelancerPresenter : InteractorToPresenterFreelancerProtocol {
    
}
