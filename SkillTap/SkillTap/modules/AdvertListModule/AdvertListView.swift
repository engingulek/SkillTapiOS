//
//  AdvertListView.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit
class AdvertListView : BaseView<AdvertListViewController> {
    private lazy var advertCollectionView : UICollectionView = UICollectionView
        .primaryCollectionView(scroolDirection: .vertical)
    
    
    override func setupView() {
        super.setupView()
        configureView()
        advertCollectionView.register(AdvertCVC.self,
                                           forCellWithReuseIdentifier: AdvertCVC.identifier)
        
    }
   
    private func configureView() {
        
        addSubview(advertCollectionView)
        advertCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
    
    func advertCollectionViewViewPrepare() {
        advertCollectionView.delegate = controller
        advertCollectionView.dataSource = controller
    }
    
    func advertCollectionViewVieRealoaData(){
        advertCollectionView.reloadData()
    }

}
