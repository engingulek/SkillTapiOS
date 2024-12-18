//
//  SearchViewController+UICollectionView.swift
//  SkillTap
//
//  Created by Engin Gülek on 18.12.2024.
//

import Foundation
import UIKit



//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension SearchViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        switch collectionView.tag {
        case 0:
            return presenter.numberOfItems(searchType: .adverts)
        case 1:
          
            return presenter.numberOfItems(searchType: .freelancer)
            
        default:
            return presenter.numberOfItems(searchType: .none)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdvertCVC.identifier,
                for: indexPath) as? AdvertCVC else {return UICollectionViewCell()}
            let advert = presenter.cellForItemAdvert(at: indexPath)
            cell.configureData(advert: advert)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FreelancerCVC.identifier,
                for: indexPath) as? FreelancerCVC else {return UICollectionViewCell()}
            let freelancer = presenter.cellForItemFreelancer(at: indexPath)
           cell.configureData(freelancer: freelancer)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            presenter.didSelectItem(selectedType: .adverts,at: indexPath)
        case 1:
            presenter.didSelectItem(selectedType: .freelancer,at: indexPath)
        default:
            presenter.didSelectItem(selectedType: .none,at: indexPath)
        }
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension SearchViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
        case 0:
            return presenter.sizeForItemAt(selectedType: .adverts,
                                           width: UIScreen.main.bounds.width,
                                           height: UIScreen.main.bounds.height)
        case 1:
            return presenter.sizeForItemAt(selectedType: .freelancer,
                                           width: UIScreen.main.bounds.width,
                                           height: UIScreen.main.bounds.height)
        default:
            return presenter.sizeForItemAt(
                selectedType: .none,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height)
        }
    }
}
