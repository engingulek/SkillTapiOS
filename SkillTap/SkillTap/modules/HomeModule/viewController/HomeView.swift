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
  
    private lazy var titleLabel = LabelFactory.createLabel(ofType: .xltitleLabel(true))
    private lazy var subTitleLabel = LabelFactory.createLabel(ofType: .largeTitleUILabel(false))
    private lazy var categoryTitleLabel = LabelFactory.createLabel(ofType: .largeTitleUILabel(true))
    private lazy var searchView : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = .white
        view.layer.cornerRadius = CornerRadiusTheme.small.rawValue
        return view
    }()
    
    private lazy var searchIcon = IconFactory.createIcon(ofType: .magnifyingglass)
    private lazy var searchLigtLabel = LabelFactory.createLabel(ofType: .lightMiddleLabel)
    private lazy var messageIcon = IconFactory.createIcon(ofType: .messageBubble)
    private lazy var errorIcon = IconFactory.createIcon(ofType: .error)
    private lazy var errorLabel  = LabelFactory.createLabel(ofType: .errorLabel())
    
    private lazy var loadingAnimation : UIActivityIndicatorView = UIActivityIndicatorView.baseActivityIndicator()
    
    

    
    private lazy var categoriesCollectionView = UICollectionView
        .primaryCollectionView(scroolDirection: .vertical)
    

    override func setupView() {
        super.setupView()
        configureView()
        
        categoriesCollectionView.register(CategoryCVC.self, 
                                          forCellWithReuseIdentifier: CategoryCVC.identifier)
      
        
    }
    
    @objc private func onTappedMessageIcon() {
        presenter?.onTappedMessageIcon()
    }

    private func configureView(){
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        messageIcon.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, 
                                                action: #selector(onTappedMessageIcon))
        messageIcon.addGestureRecognizer(tapGesture)
        addSubview(messageIcon)
        messageIcon.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.trailing.equalToSuperview().offset(-10)
            make.size.equalTo(30)
        }
        
        addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(15)
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
        
        let searchTapGesture = UITapGestureRecognizer(target: self, 
                                                      action: #selector(searchViewTapped))
        searchLigtLabel.isUserInteractionEnabled = true
        searchLigtLabel.addGestureRecognizer(searchTapGesture)
        
        
     
        addSubview(categoryTitleLabel)
        categoryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        addSubview(categoriesCollectionView)
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        addSubview(errorIcon)
        errorIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(60)
        }
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(errorIcon.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(loadingAnimation)
        loadingAnimation.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

    }
    
    @objc private func searchViewTapped() {
        presenter?.onTappedSearchBar()
    }
    
    func getSearchConfigureView(searchLigtLabelText:String) {
        searchLigtLabel.text = searchLigtLabelText
    }
    

    
    
    func categriesCollectionViewPrepare(){
        categoriesCollectionView.delegate = controller
        categoriesCollectionView.dataSource = controller
    }
    
    func categriesCollectionViewReloadData(){
        categoriesCollectionView.reloadData()
    }
    
    func setHeadTitleData(title:String,subTitle:String){
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    func setCategoryTitleLabel(_ title:String){
        categoryTitleLabel.text = title
    }
    
    func createErrorMessage(message:String){
        errorLabel.text = message
        errorIcon.isHidden = false
    }
    
    func startLoadingAnimation(){
        loadingAnimation.startAnimating()
    }
    
    func stopLoadingAnimation(){
        loadingAnimation.stopAnimating()
    }
    
}

