//
//  SubCategoryViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import UIKit

class SubCategoryViewController: UIViewController {
    lazy var presenter : ViewToPrensenterSubCategoryProtocol =
    //TODO: Switinject will be added here
    SubCategoryPresenter(view: self,router: SubCategoryRouter())
    private lazy var subCategoryView = SubCategoryView(self)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        view = subCategoryView
    }
}


extension SubCategoryViewController : PresenterToViewSubCategoryProtocol {

    
    func subCategoryCollectionViewPrepare() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            subCategoryView.subCategoryCollectionViewPrepare()
        }
    }
    
    func  subCategoryCollectionViewRealoaData() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            subCategoryView.subCategoryCollectionVieRealoaData()
        }
    }
    
    
}


extension SubCategoryViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubCategoryCVC.identifier, for: indexPath) as? SubCategoryCVC else {
            return UICollectionViewCell()
        }
        cell.setItem(text: "sub category")
        presenter.cellForItem(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}


extension SubCategoryViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItemAt(width: UIScreen.main.bounds.width,
                                       height: UIScreen.main.bounds.height)
       
    }
}
