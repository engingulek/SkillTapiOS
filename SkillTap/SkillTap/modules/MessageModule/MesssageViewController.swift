//
//  MesssageViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit
import SnapKit

class MesssageViewController: UIViewController {
   private lazy var messageView = MessageView(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view = messageView
        view.backgroundColor = .white
        messageView.messageCollectionViewPrepare()
        messageView.messageCollectionViewRealoaData()
    }
}


extension MesssageViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComingMessageCVC.identifier, for: indexPath)
                as? ComingMessageCVC else {return UICollectionViewCell()}
        return cell
    }
}


extension MesssageViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height / 14)
    }
}
