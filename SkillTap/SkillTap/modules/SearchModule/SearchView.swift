//
//  SearchView.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import Foundation
import SnapKit
import UIKit


class SearchView : BaseView<SearchViewController> {
    var presenter : ViewToPrensenterSearchProtocol?
   
    private lazy var searchView : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var advertsButton : UIButton = UIButton.basicButton(action: onTappedAdverstButton)
    private lazy var freelancersButton : UIButton = UIButton.basicButton(action: onTappedFreelancerButton)
    
    
    private lazy var onTappedAdverstButton : UIAction = UIAction { _  in
        self.advertsCollectionView.isHidden = false
        self.freelancerCollectionView.isHidden = true
        self.presenter?.onTappedAdvertsButton()
       }
    
    private lazy var onTappedFreelancerButton : UIAction = UIAction { _ in
        self.advertsCollectionView.isHidden = true
        self.freelancerCollectionView.isHidden = false
        self.presenter?.onTappedFreelancerButton()
       }
    
    
    private lazy var searchIcon : UIImageView = UIImageView.middleIcon(systemName: "magnifyingglass")
    
    private lazy var searchTextField : UITextField = UITextField.searchTextField()
    override func setupView() {
        super.setupView()
        configureView()
        advertsCollectionView.isHidden = false
        freelancerCollectionView.isHidden = true
        searchTextField.addTarget(self, action: #selector(searchTextFieldEditChanged(_:)), for: .editingChanged)
        advertsCollectionView.register(AdvertCVC.self, forCellWithReuseIdentifier: AdvertCVC.identifier)
        freelancerCollectionView.register(FreelancerCVC.self, forCellWithReuseIdentifier: FreelancerCVC.identifier)
    }
    
    @objc private func searchTextFieldEditChanged(_ textField: UITextField) {
        presenter?.onChangedSearctTextField(text: textField.text)
    }
    
    private lazy var advertsCollectionView = UICollectionView.primaryCollectionView(tag:0,scroolDirection: .vertical)
    private lazy var freelancerCollectionView = UICollectionView.primaryCollectionView(tag:1,scroolDirection: .vertical)
    
    

    
    
    private func configureView(){
        addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
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
        
        searchView.addSubview(searchTextField)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(searchIcon.snp.top)
            make.bottom.equalTo(searchIcon.snp.bottom)
            make.leading.equalTo(searchIcon.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        addSubview(advertsButton)
        advertsButton.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        addSubview(freelancersButton)
        freelancersButton.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        addSubview(advertsCollectionView)
        advertsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(advertsButton.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        addSubview(freelancerCollectionView)
        freelancerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(freelancersButton.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    
        
       
    
    }
    
    
    func setSearchPlaceholder(searchPlaceholder:String){
        searchTextField.placeholder = searchPlaceholder
    }
    
    func setAdvertsButton(text:String,textColor:String,backColor:String,borderColor:String){
        advertsButton.setTitleColor(UIColor(hex: textColor), for: .normal)
        advertsButton.setTitle(text, for: .normal)
        advertsButton.backgroundColor = UIColor(hex: backColor)
        advertsButton.layer.borderColor = UIColor(hex: borderColor)?.cgColor
    }
    
    
    func setFreelancersButton(text:String,textColor:String,backColor:String,  borderColor:String){
        freelancersButton.setTitleColor(UIColor(hex: textColor), for: .normal)
        freelancersButton.setTitle(text, for: .normal)
        freelancersButton.backgroundColor = UIColor(hex: backColor)
        freelancersButton.layer.borderColor = UIColor(hex: borderColor)?.cgColor
    }
    
    func advertsCollectionViewPrepare(){

        advertsCollectionView.delegate = controller
        advertsCollectionView.dataSource = controller
    }
    
    func advertsCollectionViewReloadData(){
        advertsCollectionView.reloadData()
    }
    
    func freelancerCollectionViewPrepare(){
        freelancerCollectionView.delegate = controller
        freelancerCollectionView.dataSource = controller
    }
    
    func freelancerCollectionViewReloadData(){
        freelancerCollectionView.reloadData()
    }
    
 
 
}
