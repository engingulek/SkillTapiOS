//
//  LastMessageListViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class RoomListViewController: UIViewController {

    private lazy var lastMessageListView = RoomListView(self)
     lazy var presenter : ViewToPrensenterRoomListProtocol = RoomListPresenter(
        view: self,
        router: RoomListRouter(),
        interactor: RoomListInteractor())
    override func viewDidLoad() {
        super.viewDidLoad()
        view = lastMessageListView
        presenter.viewDidLoad()
       
    }
}

extension RoomListViewController : PresenterToViewRoomListProtocol {
    func roomListCollectionViewPrepare() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            lastMessageListView.lastMessageListCollectionViewPrepare()
        }
    }
    
    func roomListCollectionViewRealoaData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            lastMessageListView.lastMessageListCollectionViewRealoaData()
        }
    }
    
    
}

extension RoomListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomCVC.identifier, for: indexPath) as? RoomCVC else {return UICollectionViewCell()}
        let room = presenter.cellForItem(at: indexPath)
        cell.configureData(room: room)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}


extension RoomListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  presenter.sizeForItemAt(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
    }
}
