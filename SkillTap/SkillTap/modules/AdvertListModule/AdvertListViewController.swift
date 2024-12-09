//
//  AdvertListViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class AdvertListViewController: ViewController {
    private lazy var advertListView = AdvertListView(self)
    lazy var presenter : ViewToPrensenterAdvertListProtocol = AdvertListPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = advertListView
        advertListView.advertCollectionViewViewPrepare()
        advertListView.advertCollectionViewVieRealoaData()
        
    }
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension AdvertListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AdvertCVC.identifier,
            for: indexPath) as? AdvertCVC else {return UICollectionViewCell()}
        cell.configureData()
        presenter.cellForItem(at: indexPath)
        return cell
    }
}


//MARK: UICollectionViewDelegateFlowLayout
extension AdvertListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItemAt(width: UIScreen.main.bounds.width,
                                       height: UIScreen.main.bounds.height)
    }
}

extension AdvertListViewController : PresenterToViewAdvertListProtocol {
    func advertListCollectionViewPrepare() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            advertListView.advertCollectionViewViewPrepare()
        }
    }
    
    func advertListCollectionViewRealoaData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            advertListView.advertCollectionViewVieRealoaData()
        }
    }
    
    
}
