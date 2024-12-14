//
//  FreelancerDetailViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import UIKit

class FreelancerDetailViewController: ViewController {
    lazy var presenter : ViewToPrensenterFreelancerDetailProtocol = FreelancerDetailPresenter(view:self)
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
    
    func freelancerInfoViewData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            freelancerView.configureDataForFreelancerInfoView()
        }
    }
    
    func freelancerViewData(title:String) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            freelancerView.configureDateFreelancerView(title: title)
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
        presenter.cellForItem(at: indexPath)
       // cell.configureData()
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
