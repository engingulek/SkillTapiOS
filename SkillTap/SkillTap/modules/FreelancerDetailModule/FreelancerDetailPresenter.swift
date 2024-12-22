//
//  FreelancerPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

final class FreelancerDetailPresenter {
    weak var view : PresenterToViewFreelancerDetailProtocol?
    private let interactor : PresenterToInteractorFreelancerDetailProtocol
    private var adverts : [Advert] = []
    init(view: PresenterToViewFreelancerDetailProtocol?,
         interactor : PresenterToInteractorFreelancerDetailProtocol
    ) {
        self.view = view
        self.interactor = interactor
    }
}


//MARK: ViewToPrensenterFreelancerProtocol
extension FreelancerDetailPresenter : ViewToPrensenterFreelancerDetailProtocol {

    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.lightBackColor.color)
        view?.changeTitle(title: TextTheme.freelancerDetail.text)
        view?.advertsColllectionViewPrepare()
        view?.advertsCollectionViewReloadData()
       
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width - 10, height: height / 4)
    }
    
    func numberOfItemsIn() -> Int {
        return adverts.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> Advert {
        let advert  = adverts[indexPath.item]
        return advert
    }
    
    
    func fetchFreelancerDetail(id: Int) {
        Task{
            await interactor.fetchFreelancerDetail(id:id)
        }
    }

}


//MARK: InteractorToPresenterFreelancerProtocol
extension FreelancerDetailPresenter : InteractorToPresenterFreelancerDetailProtocol {
    func sendFreelancerDetail(_ freelancerDetail: FreelancerDetail?) {
        guard let detail = freelancerDetail else {
            view?.freelancerConfigureData(freelancer: nil,errorState:true)
            adverts = []
            view?.advertsCollectionViewReloadData()
            return
        }
        view?.freelancerConfigureData(freelancer: detail, errorState: false)
        adverts = detail.adverts
        view?.advertsCollectionViewReloadData()
        
        
    }
}
