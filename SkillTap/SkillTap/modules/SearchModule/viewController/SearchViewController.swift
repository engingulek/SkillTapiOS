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
    
    func setAdvertsButtonDesign(text: String, 
                                textColor: String,
                                backColor: String,
                                borderColor:String) {
        searchView.setAdvertsButton(
            text: text,
            textColor: textColor,
            backColor: backColor,
            borderColor:borderColor
        )
    }
    
    func setFreelancerButtonDesign(text: String, 
                                   textColor: String,
                                   backColor: String,
                                   borderColor:String) {
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


