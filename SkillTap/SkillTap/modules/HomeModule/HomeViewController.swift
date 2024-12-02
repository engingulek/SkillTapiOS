//
//  HomeViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import UIKit

class HomeViewController: UIViewController {
    //Swiftinject will be added to here
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
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.topOptionsNumberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: TopOptionCVC.identifier,
                for: indexPath) as? TopOptionCVC else {return UICollectionViewCell()}
        let item = presenter.topCellForItem(indexPath: indexPath)
        cell.setItem(
            text: item.topOption,
            borderColor: item.borderColor,
            textColor: item.textColor)
        return cell
    }
}
