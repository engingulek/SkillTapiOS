//
//  FreelancerVierw.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
import SnapKit
class FreelancerView : BaseView<FreelancerDetailViewController> {
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var freelancerInfoView = FreelancerInfoView()
    private lazy var advertsTitle : UILabel = UILabel.middleTitleLabel()
    private lazy var advertsCollectionView : UICollectionView 
    = UICollectionView.primaryCollectionView(scroolDirection: .horizontal)
    override func setupView() {
        super.setupView()
        configureView()
        advertsCollectionView.register(AdvertCVC.self, forCellWithReuseIdentifier: AdvertCVC.identifier)
    }
    
    
    private func configureView(){
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        contentView.addSubview(freelancerInfoView)
        
        
        freelancerInfoView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
        }
        
        
        
        contentView.addSubview(advertsTitle)
        advertsTitle.snp.makeConstraints { make in
            make.top.equalTo(freelancerInfoView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
      
      
        addSubview(advertsCollectionView)
        advertsCollectionView.backgroundColor = UIColor(hex: ColorTheme.lightBackColor.color)
        advertsCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(advertsTitle.snp.bottom).offset(10)
            make.height.equalToSuperview().multipliedBy(0.25)
          
        }
        
        
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(advertsCollectionView.snp.bottom).offset(10)
        }
        
    }
    
    
    func configureDataForFreelancerInfoView(){
        freelancerInfoView.configureData()
    }
    
    func configureDateFreelancerView(title:String){
        advertsTitle.text = title
    }
    
   
    
    func advertsCollectionViewPrepare() {
        advertsCollectionView.dataSource = controller
        advertsCollectionView.delegate = controller
    }
    
    func advertsCollectionViewReloadData() {
        advertsCollectionView.reloadData()
    }
    
    
}
