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
        router: HomeRouter()
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

    
    func topOptionsCollectionViewPrepare() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.topOptionsCollectionViewPrepare()
        }
    }
    
    func topOptionsCollectionViewReloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeView.topOptionsCollectionViewReloadData()
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
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfItemsIn(tag: collectionView.tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: TopOptionCVC.identifier,
                    for: indexPath) as? TopOptionCVC else {return UICollectionViewCell()}
            let item = presenter.cellForItem(tag:0,indexPath: indexPath)
            cell.setItem(
                text: item.topOption,
                borderColor: item.borderColor,
                textColor: item.textColor)
            return cell
        case 1:
            guard let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: CategoryCVC.identifier,
                    for: indexPath) as? CategoryCVC else {return UICollectionViewCell()}
            let _ = presenter.cellForItem(tag: 1, indexPath: indexPath)
            cell.setBannerCongigure()
            return cell
        default:
            return UICollectionViewCell()
        }
   
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(tag: collectionView.tag, at: indexPath)
    }
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItem(
            tag: collectionView.tag,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height)
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let item = presenter.insetForSection(tag: collectionView.tag)
        
        return UIEdgeInsets(
            top: item.top,
            left: item.left,
            bottom: item.bottom,
            right: item.right)
    }
}

