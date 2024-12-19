//
//  HomeViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import UIKit

class HomeViewController: UIViewController {
    //TODO: Swiftinject will be added to here
    lazy var presenter : ViewToPrensenterHomeProtocol = HomePresenter(
        view: self,
        router: HomeRouter(),
        interactor: HomeInteractor()
    )
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


//MARK: PresenterToViewHomeProtocol
extension HomeViewController : PresenterToViewHomeProtocol {

    func setSearchConfigureView(searchLigtLabelText: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.getSearchConfigureView( searchLigtLabelText: searchLigtLabelText)
        }
    }

    func setHeadData(title: String, subtitle: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.setHeadTitleData(title: title, subTitle: subtitle)
            
        }
    }
    
    func setCategoryTitleLabel(title: String) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            homeView.setCategoryTitleLabel(title)
        }
        
    }
    
    func categoriesCollectioViewPreapare() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            homeView.categriesCollectionViewPrepare()
        }
    }
    
    func categoriesCollectionViewRealoadData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            homeView.categriesCollectionViewReloadData()
        }
    }
    
    func createErrorMessageForCategories( message: String) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            homeView.createErrorMessage(message: message)
        }
    }
    
    func startLoadignAnimation() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            homeView.startLoadingAnimation()
        }
    }
    
    
    func stopLoadingAnimation() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            homeView.stopLoadingAnimation()
        }
    }
}


