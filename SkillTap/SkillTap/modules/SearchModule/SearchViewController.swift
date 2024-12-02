//
//  SearchViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import UIKit

class SearchViewController: UIViewController {
    lazy var presenter : ViewToPrensenterSearchProtocol = SearchPresenter(view: self)
    
    private lazy var searchView = SearchView(self)
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
    
    override func loadView() {
        searchView.presenter = presenter
        view = searchView
    }
}



extension SearchViewController : PresenterToViewSearchProtocol {
   
    
    func setSearchTextFieldPlaceholder(_ placeholder: String) {
        searchView.setSearchPlaceholder(searchPlaceholder: placeholder)
    }
    
    func setAdvertsButtonDesign(text: String, textColor: String, backColor: String,borderColor:String) {
        searchView.setAdvertsButton(
            text: text,
            textColor: textColor,
            backColor: backColor,
            borderColor:borderColor
        )
    }
    
    func setFreelancerButtonDesign(text: String, textColor: String, backColor: String,borderColor:String) {
        searchView.setFreelancersButton(
            text: text,
            textColor: textColor,
            backColor: backColor,
            borderColor:borderColor
        )
    }
    
    
    func advertsCollectionViewPrepare() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return }
            searchView.advertsCollectionViewPrepare()
        }
    }
    
    func freelancerCollectionViewPrepare() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return }
            searchView.freelancerCollectionViewPrepare()
        }
    }
    
    func advertsCollectionViewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return }
            searchView.advertsCollectionViewReloadData()
        }
    }
    
    func freelancerCollectionViewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return }
            searchView.freelancerCollectionViewReloadData()
        }
    }
    

}


//MARK: UICollectionViewDelegate,UICollectionViewDataSource 
extension SearchViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            presenter.cellForItem(selectedType: .adverts, at: indexPath)
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdvertCVC.identifier,
                for: indexPath) as? AdvertCVC else {return UICollectionViewCell()}
            cell.configureData()
            return cell
        case 1:
            presenter.cellForItem(selectedType: .freelancer, at: indexPath)
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FreelancerCVC.identifier,
                for: indexPath) as? FreelancerCVC else {return UICollectionViewCell()}
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

//MARK: UICollectionViewDelegateFlowLayout 
extension SearchViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, 
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
        case 0:
            return presenter.sizeForItemAt(selectedType: .adverts, 
                                           width: UIScreen.main.bounds.width,
                                           height: UIScreen.main.bounds.height)
        case 1:
            return presenter.sizeForItemAt(selectedType: .freelancer,
                                           width: UIScreen.main.bounds.width,
                                           height: UIScreen.main.bounds.height)
        default:
            return presenter.sizeForItemAt(
                selectedType: .none,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height)
        }
    }
}