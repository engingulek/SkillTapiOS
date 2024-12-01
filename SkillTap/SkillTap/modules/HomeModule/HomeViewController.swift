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
    
    func setSearchConfigureView(searchLigtLabelText: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.getSearchConfigureView( searchLigtLabelText: searchLigtLabelText)
        }
    }
    
    func setFindFreelancerBanner(title: String, imageUrl: String, subTitle: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.getFindFreelancerBanner(
                title: title,
                imageUrl: imageUrl,
                bannerSubTitleText: subTitle
            )
        }
    }
    
    func setAdvertBanner(title: String, imageUrl: String, subTitle: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.getAdvertBanner(
                title: title,
                imageUrl: imageUrl,
                bannerSubTitleText: subTitle
            )
        }
    }
    
  
}
