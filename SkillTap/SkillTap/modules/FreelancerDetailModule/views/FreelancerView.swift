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
    private lazy var freelancerInfoView = FreelancerInfoView()
    private lazy var advertsTitle : UILabel = UILabel.middleTitleLabel()
    private lazy var advertsCollectionView : UICollectionView
    = UICollectionView.primaryCollectionView(scroolDirection: .horizontal)
    private lazy var errorMessageLabel : UILabel = UILabel.erroeLabel()
    override func setupView() {
        super.setupView()
        configureView()
        advertsCollectionView.register(AdvertCVC.self, forCellWithReuseIdentifier: AdvertCVC.identifier)
        advertsTitle.text = TextTheme.adverts.text
    }
    
    
    private func configureView(){
        
        addSubview(freelancerInfoView)
        
        
        freelancerInfoView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        
        
        addSubview(advertsTitle)
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
        
        addSubview(errorMessageLabel)
        errorMessageLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    
        
    }
    
    
    func configureData(_ freelancer:FreelancerDetail? ,_ errorState:Bool){
        if(errorState){
            freelancerInfoView.isHidden = true
            advertsTitle.isHidden = true
            advertsCollectionView.isHidden = true
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = TextTheme.errorMessage.text
            
        }else{
            guard let freelancer = freelancer else {return}
            freelancerInfoView.configureData(freelancer: freelancer)
            freelancerInfoView.isHidden = false
            advertsTitle.isHidden = false
            advertsCollectionView.isHidden = false
            errorMessageLabel.isHidden = true
        }
       
      
    }
    

    func advertsCollectionViewPrepare() {
        advertsCollectionView.dataSource = controller
        advertsCollectionView.delegate = controller
    }
    
    func advertsCollectionViewReloadData() {
        advertsCollectionView.reloadData()
    }
    
    
}
