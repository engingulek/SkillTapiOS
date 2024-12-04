//
//  SubCatgoryView.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import Foundation
import UIKit
import SnapKit
class SubCategoryView : BaseView<SubCategoryViewController> {
    private lazy var subCategoryCollectionView : UICollectionView = UICollectionView
        .primaryCollectionView(scroolDirection: .vertical)
    
    override func setupView() {
        super.setupView()
        configureView()
        subCategoryCollectionView.register(SubCategoryCVC.self,
                                           forCellWithReuseIdentifier: SubCategoryCVC.identifier)
        
    }
    
    private func configureView() {
        
        addSubview(subCategoryCollectionView)
        subCategoryCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
    
    func subCategoryCollectionViewPrepare() {
        subCategoryCollectionView.delegate = controller
        subCategoryCollectionView.dataSource = controller
    }
    
    func subCategoryCollectionVieRealoaData(){
        subCategoryCollectionView.reloadData()
    }
    
}
