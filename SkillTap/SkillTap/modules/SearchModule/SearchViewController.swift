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
    
    
}
