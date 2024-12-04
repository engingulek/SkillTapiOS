//
//  SubCategoryPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import Foundation

final class SubCategoryPresenter {
    weak var view : PresenterToViewSubCategoryProtocol?
    init(view: PresenterToViewSubCategoryProtocol?) {
        self.view = view
    }
}


//MARK: ViewToPrensenterSubCategoryProtocol
extension SubCategoryPresenter : ViewToPrensenterSubCategoryProtocol {
   
  
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.changeTitle(title: TextTheme.subCategoriesNavTitle.text)
        view?.subCategoryCollectionViewPrepare()
        view?.subCategoryCollectionViewRealoaData()
    }
    
    
    func numberOfItemsIn() -> Int {
        return 10
    }
    func cellForItem(at indexPath: IndexPath) {
        
    }
    
    func didSelectItem(at indexPath:IndexPath){
        
    }
    
    func sizeForItemAt(width: CGFloat,
                       height: CGFloat) -> CGSize {
        return CGSize(width: width, height:height / 14)
    }
    
    

    
    /*/return CGSize(width: width, height:height / 14)*/
    
}
//MARK: InteractorToPresenterSubCategoryProtocol
extension SubCategoryPresenter : InteractorToPresenterSubCategoryProtocol {
    
}
