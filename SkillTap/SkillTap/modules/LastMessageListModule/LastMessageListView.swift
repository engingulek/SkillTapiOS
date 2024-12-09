//
//  LastMessageListView.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit
import SnapKit
class LastMessageListView : BaseView<LastMessageListViewController> {
    private lazy var lastMessageListCollectionView : UICollectionView = UICollectionView
        .primaryCollectionView(scroolDirection: .vertical)
    
    override func setupView() {
        super.setupView()
        configureView()
        lastMessageListCollectionView.register(LastMessageCVC.self, forCellWithReuseIdentifier: LastMessageCVC.identifier)
    }
    
    
    private func configureView() {
        addSubview(lastMessageListCollectionView)
        lastMessageListCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    
    func lastMessageListCollectionViewPrepare() {
        lastMessageListCollectionView.delegate = controller
        lastMessageListCollectionView.dataSource = controller
    }
    
    func lastMessageListCollectionViewRealoaData(){
        lastMessageListCollectionView.reloadData()
    }
    
    
    
}
