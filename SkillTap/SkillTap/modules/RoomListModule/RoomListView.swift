//
//  LastMessageListView.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit
import SnapKit
class RoomListView : BaseView<RoomListViewController> {
    private lazy var roomListCollectionView : UICollectionView = UICollectionView
        .primaryCollectionView(scroolDirection: .vertical)
    
    override func setupView() {
        super.setupView()
        configureView()
        roomListCollectionView.register(RoomCVC.self, forCellWithReuseIdentifier: RoomCVC.identifier)
    }
    
    
    private func configureView() {
        addSubview(roomListCollectionView)
        roomListCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    
    func lastMessageListCollectionViewPrepare() {
        roomListCollectionView.delegate = controller
        roomListCollectionView.dataSource = controller
    }
    
    func lastMessageListCollectionViewRealoaData(){
        roomListCollectionView.reloadData()
    }
    
    
    
}
