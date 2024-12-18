//
//  AdvertDetailViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import UIKit

class AdvertDetailViewController: ViewController {
    
    lazy var presenter : ViewToPrensenterAdvertDetailProtocol
    = AdvertDetailPresenter(view: self,
                            router: AdvertDetailRouter(),
                            interactor: AdvertDetailInteractor()
    )
    private lazy var advertDetailView = AdvertDetailView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        advertDetailView.presenter = presenter
        view = advertDetailView
        
    }
}

extension AdvertDetailViewController : PresenterToViewAdvertDetailProtocol {
 
    
    func getAdvertDetail(
        detail: (baseImageUrl: String,
                 freelancer: FreelancerOnAdvertDetail)?,
        errorState: Bool) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return }
                advertDetailView.getAdvertDetail(detail: detail, errorState: errorState)
                
            }
        }
    
    func getAdvertPackage(package: Package) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return }
            advertDetailView.getAdvertPackage(package)
        }
    }
}
