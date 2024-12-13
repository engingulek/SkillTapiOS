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
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: CategoryCVC.identifier,
                for: indexPath) as? CategoryCVC else {return UICollectionViewCell()}
        let category = presenter.cellForItem( indexPath: indexPath)
        cell.configureData(category: category)
        return cell
   
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem( at: indexPath)
    }
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItem(
          
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height)
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let item = presenter.insetForSection()
        
        return UIEdgeInsets(
            top: item.top,
            left: item.left,
            bottom: item.bottom,
            right: item.right)
    }
}

