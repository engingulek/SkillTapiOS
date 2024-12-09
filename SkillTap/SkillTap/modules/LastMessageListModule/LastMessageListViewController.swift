//
//  LastMessageListViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class LastMessageListViewController: ViewController {

    private lazy var lastMessageListView = LastMessageListView(self)
     lazy var presenter : ViewToPrensenterLastMessageListProtocol = LastMessageListPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = lastMessageListView
        presenter.viewDidLoad()
       
    }
}

extension LastMessageListViewController : PresenterToViewLastMessageListProtocol {
    func lastMessageListCollectionViewPrepare() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            lastMessageListView.lastMessageListCollectionViewPrepare()
        }
    }
    
    func lastMessageListCollectionViewRealoaData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            lastMessageListView.lastMessageListCollectionViewRealoaData()
        }
    }
    
    
}

extension LastMessageListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LastMessageCVC.identifier, for: indexPath) as? LastMessageCVC else {return UICollectionViewCell()}
        presenter.cellForItem(at: indexPath)
        return cell
    }
}


extension LastMessageListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  presenter.sizeForItemAt(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
    }
}
