//
//  FreelancerPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

final class FreelancerDetailPresenter {
    weak var view : PresenterToViewFreelancerDetailProtocol?
    init(view: PresenterToViewFreelancerDetailProtocol?) {
        self.view = view
    }
}


//MARK: ViewToPrensenterFreelancerProtocol
extension FreelancerDetailPresenter : ViewToPrensenterFreelancerDetailProtocol {

  
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.lightBackColor.color)
        view?.changeTitle(title: TextTheme.freelancerDetail.text)
        view?.advertsColllectionViewPrepare()
        view?.advertsCollectionViewReloadData()
        view?.freelancerViewData(title: TextTheme.adverts.text)
        view?.freelancerInfoViewData()
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width - 10, height: height / 4)
    }
    
    func numberOfItemsIn() -> Int {
        return 5
    }
    
    func cellForItem(at indexPath: IndexPath) {
        
    }
    
    

}


//MARK: InteractorToPresenterFreelancerProtocol
extension FreelancerDetailPresenter : InteractorToPresenterFreelancerDetailProtocol {
    
}
