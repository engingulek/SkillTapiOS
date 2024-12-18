//
//  FreelancerDetailViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import UIKit

class FreelancerDetailViewController: ViewController {
    lazy var presenter : ViewToPrensenterFreelancerDetailProtocol = FreelancerDetailPresenter(view:self,interactor: FreelancerDetailInteractor())
    private lazy var freelancerView = FreelancerView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        //TODO: move to presenter
       
        
    }
    
    override func loadView() {
        view = freelancerView
    }
    
    
}

//MARK: PresenterToViewFreelancerProtocol
extension FreelancerDetailViewController : PresenterToViewFreelancerDetailProtocol {
    
   
    func advertsColllectionViewPrepare() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            freelancerView.advertsCollectionViewPrepare()
        }
    }
    
    func advertsCollectionViewReloadData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            freelancerView.advertsCollectionViewReloadData()
        }
    }
    
    func freelancerConfigureData(freelancer: FreelancerDetail?, errorState: Bool) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            freelancerView.configureData(freelancer,errorState)
        }
    }
    
  
    
}



extension FreelancerDetailViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, 
                        numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertCVC.identifier, for: indexPath) as? AdvertCVC
        else {return UICollectionViewCell()}
        let advert = presenter.cellForItem(at: indexPath)
        cell.configureData(advert: advert)
        return cell
    }
}


extension FreelancerDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItemAt(width: UIScreen.main.bounds.width,
                                       height: UIScreen.main.bounds.height)
    }
}
