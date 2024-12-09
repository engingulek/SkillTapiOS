//
//  AdvertDetailViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import UIKit

class AdvertDetailViewController: ViewController {
    
    lazy var presenter : ViewToPrensenterAdvertDetailProtocol
    = AdvertDetailPresenter(view: self,router: AdvertDetailRouter())
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
    
}
