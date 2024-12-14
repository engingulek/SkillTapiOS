//
//  SearchViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import UIKit

class SearchViewController: UIViewController {
    lazy var presenter : ViewToPrensenterSearchProtocol = 
    SearchPresenter(view: self,
                    router: SearchRouter(),
    interactor: SearchInteractor())
    
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
    
    
    func createSearchIconWhenOpenPage(isHidden:Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return }
            searchView.pageSearchIconHiddenState(isHidden)
        }
    }
}


//MARK: UICollectionViewDelegate,UICollectionViewDataSource 
extension SearchViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = presenter.cellForItem(at: indexPath)
        switch collectionView.tag {
        case 0:
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdvertCVC.identifier,
                for: indexPath) as? AdvertCVC else {return UICollectionViewCell()}
            cell.configureData(advert: item.advert)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FreelancerCVC.identifier,
                for: indexPath) as? FreelancerCVC else {return UICollectionViewCell()}
            cell.configureData()
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            presenter.didSelectItem(selectedType: .adverts,at: indexPath)
        case 1:
            presenter.didSelectItem(selectedType: .freelancer,at: indexPath)
        default:
            presenter.didSelectItem(selectedType: .none,at: indexPath)
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
