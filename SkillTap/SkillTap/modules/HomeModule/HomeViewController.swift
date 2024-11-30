//
//  HomeViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var presenter : ViewToPrensenterHomeProtocol = HomePresenter(view: self)
     private lazy var homeView = HomeView(self)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        
        homeView.presenter = presenter
        view = homeView
    }
}



extension HomeViewController : PresenterToViewHomeProtocol {
    func setConfigureView(searchLigtLabelText: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.getConfigure( searchLigtLabelText: searchLigtLabelText)
        }
    }
}
