//
//  LastMessageListViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class LastMessageListViewController: ViewController {

    private lazy var lastMessageListView = LastMessageListView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = lastMessageListView
        lastMessageListView.lastMessageListCollectionViewPrepare()
        lastMessageListView.lastMessageListCollectionViewRealoaData()
       
    }
}

extension LastMessageListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LastMessageCVC.identifier, for: indexPath) as? LastMessageCVC else {return UICollectionViewCell()}
        return cell
    }
}


extension LastMessageListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 12)
    }
}
