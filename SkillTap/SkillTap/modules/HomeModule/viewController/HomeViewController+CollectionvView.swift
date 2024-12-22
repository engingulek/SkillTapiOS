//
//  HomeViewController+CollectionvView.swift
//  SkillTap
//
//  Created by Engin Gülek on 18.12.2024.
//

import Foundation
import UIKit

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: CategoryCVC.identifier,
                for: indexPath) as? CategoryCVC else {return UICollectionViewCell()}
        let category = presenter.cellForItem( indexPath: indexPath)
        cell.configureData(category: category)
        return cell
   
    }
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItem(
          
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height)
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let item = presenter.insetForSection()
        
        return UIEdgeInsets(
            top: item.top,
            left: item.left,
            bottom: item.bottom,
            right: item.right)
    }
}
