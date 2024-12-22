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
    private let interactor : PresenterToInteractorAdvertDetailProtocol
    private var advertDetail:AdvertDetail?
    init(view: PresenterToViewAdvertDetailProtocol?,router:PresenterToRouterAdvertDetailProtocol,
         interactor:PresenterToInteractorAdvertDetailProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


//MARK: ViewToPrensenterAdvertDetailProtocol
extension AdvertDetailPresenter : ViewToPrensenterAdvertDetailProtocol {
    
    
    func fetchAdvertDetail(id: Int) {
        Task{
            
            await interactor.fetchAdvertDetail(id:id)
            
        }
    }
    
    func packageSegmentedConrollerChanged(index: Int) {
        guard let advertDetail = advertDetail else {return}
        let selectedPackage = advertDetail.packages[index]
        view?.getAdvertPackage(package: selectedPackage)
        
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color:  ColorTheme.lightBackColor.color)
        view?.changeTitle(title: TextTheme.advertDetailNav.text)
        
  
    }
    
    func onTappedSendMessageButton() {
        router.toMessage(view: view)
    }
}


//MARK: InteractorToPresenterAdvertDetailProtocol
extension AdvertDetailPresenter : InteractorToPresenterAdvertDetailProtocol {
    func sendAdvertDetail(_ sendAdvertDetail: AdvertDetail?) {
        advertDetail = sendAdvertDetail
        guard let advertDetail = advertDetail else {
           
            view?.getAdvertDetail(detail: nil, errorState: true)
            return
        }
        let detail : (baseImageUrl:String,freelancer:FreelancerOnAdvertDetail)
        detail = (baseImageUrl:advertDetail.image,freelancer:advertDetail.freelancer)
        view?.getAdvertDetail(detail: detail, errorState: false)
        
        let startPackage = advertDetail.packages[0]
        view?.getAdvertPackage(package: startPackage)
    }
    
    
}
