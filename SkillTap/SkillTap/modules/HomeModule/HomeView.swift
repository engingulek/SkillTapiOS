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
    private lazy var titleLabel : UILabel = UILabel.xltitleUILabel(bold: true)
    private lazy var subTitleLabel : UILabel = UILabel.largeTitleUILabel(bold: false)
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
    private lazy var createWorkBanner : BannerView = BannerView()
    private lazy var findFreelancerBannerView : BannerView = BannerView()
    
    private lazy var topOptionsCollectionView = UICollectionView.primaryCollectionView(scroolDirection: .horizontal)
    
   
    

    override func setupView() {
        super.setupView()
        configureView()
        topOptionsCollectionView.register(TopOptionCVC.self, forCellWithReuseIdentifier: TopOptionCVC.identifier)
    }

    private func configureView(){
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
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
        
        let searchTapGesture = UITapGestureRecognizer(target: self, action: #selector(searchViewTapped))
        searchLigtLabel.isUserInteractionEnabled = true
        searchLigtLabel.addGestureRecognizer(searchTapGesture)
        
        
        addSubview(topOptionsCollectionView)
        topOptionsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(60)
        }
        

        addSubview(createWorkBanner)
        createWorkBanner.snp.makeConstraints { make in
            make.top.equalTo(topOptionsCollectionView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        addSubview(findFreelancerBannerView)
        findFreelancerBannerView.snp.makeConstraints { make in
            make.top.equalTo(topOptionsCollectionView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }
    
    @objc private func searchViewTapped() {
        presenter?.onTappedSearchBar()
    }
    
    func getSearchConfigureView(searchLigtLabelText:String) {
        searchLigtLabel.text = searchLigtLabelText
    }
    
    func getFindFreelancerBanner(
        title:String,
        imageUrl:String,bannerSubTitleText:String){
        findFreelancerBannerView.setBannerCongigure(
            text: title,
            bannerImageUrl: imageUrl,
            bannerSubText: bannerSubTitleText
        )
    }
    
    func getAdvertBanner(title:String,
                             imageUrl:String,
                             bannerSubTitleText:String){
        createWorkBanner.setBannerCongigure(text: title,
                                            bannerImageUrl: imageUrl,
                                            bannerSubText: bannerSubTitleText)
    }
    
    func topOptionsCollectionViewPrepare(){
        topOptionsCollectionView.delegate = controller
        topOptionsCollectionView.dataSource = controller
    }
    
    func topOptionsCollectionViewReloadData(){
        topOptionsCollectionView.reloadData()
    }
    
    func setHeadTitleData(title:String,subTitle:String){
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
}
