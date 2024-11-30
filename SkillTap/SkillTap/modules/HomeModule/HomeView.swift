//
//  HomeView.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import SnapKit
import UIKit
class HomeView : BaseView<HomeViewController> {
    var presenter : ViewToPrensenterHomeProtocol?
    
    private lazy var searchView : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var searchIcon : UIImageView = UIImageView.middleIcon(systemName: "magnifyingglass")
    private lazy var searchLigtLabel : UILabel = UILabel.lightMiddleLabel()

    
    override func setupView() {
        super.setupView()
        configureView()
    }

    private func configureView(){
        addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        searchView.addSubview(searchIcon)
        searchIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(25)
        }
        
        searchView.addSubview(searchLigtLabel)
        searchLigtLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(searchIcon.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(10)
        }
        
        let searchTapGesture = UITapGestureRecognizer(target: self, action: #selector(searchViewTapped))
        searchLigtLabel.isUserInteractionEnabled = true
        searchLigtLabel.addGestureRecognizer(searchTapGesture)
    }
    
    @objc private func searchViewTapped() {
        presenter?.onTappedSearchBar()
    }
    
    func getConfigure(searchLigtLabelText:String) {
        searchLigtLabel.text = searchLigtLabelText
    }
    
}
