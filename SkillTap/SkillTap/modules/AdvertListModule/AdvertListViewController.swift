//
//  AdvertListViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import UIKit

class AdvertListViewController: ViewController {
    private lazy var advertListView = AdvertListView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = advertListView
        advertListView.advertCollectionViewViewPrepare()
        advertListView.advertCollectionViewVieRealoaData()
        
    }
}



extension AdvertListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AdvertCVC.identifier,
            for: indexPath) as? AdvertCVC else {return UICollectionViewCell()}
        cell.configureData()
        return cell
    }
}


extension AdvertListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 10, height :UIScreen.main.bounds.height / 4)
    }
}
