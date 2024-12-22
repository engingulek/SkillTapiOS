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
    lazy var presenter : ViewToPrensenterMessageProtocol = MessagePresenter(view: self,interactor: MessageInteractor())
    override func viewDidLoad() {
        super.viewDidLoad()
        messageView.presenter = presenter
       view = messageView
        presenter.viewDidLoad()
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension MesssageViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = presenter.cellForItem(at: indexPath)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCVC.identifier, for: indexPath)
                as? MessageCVC else {return UICollectionViewCell()}
        cell.changeViewAccordindMessagePostion(
            messagePositon: item.position,
            backColor: item.backColor)
        cell.configureData(message: item.messageData)
   
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension MesssageViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      return  presenter.sizeForItemAt(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
    }
}

//MARK: PresenterToViewMessageProtocol
extension MesssageViewController : PresenterToViewMessageProtocol {
    func messageCollectionViewPrepare() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            messageView.messageCollectionViewPrepare()
           
        }
    }
    
    func messageCollectionViewRealoaData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            messageView.messageCollectionViewRealoaData()
        }
    }
}
