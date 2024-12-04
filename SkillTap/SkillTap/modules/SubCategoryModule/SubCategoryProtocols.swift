//
//  SubCategoryProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 4.12.2024.
//

import Foundation

typealias SubCategoryKits = UIViewAble & NavConUIAble

//MARK: ViewToPrensenterSubCategoryProtocol
protocol ViewToPrensenterSubCategoryProtocol{
    var view : PresenterToViewSubCategoryProtocol? {get}
    func viewDidLoad()
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath)
    func didSelectItem(at indexPath:IndexPath)
    func sizeForItemAt(width:CGFloat,
                       height:CGFloat) -> CGSize
    

    
    
}

//MARK: PresenterToViewSubCategoryProtocol
protocol PresenterToViewSubCategoryProtocol : AnyObject,SubCategoryKits{
 
    func subCategoryCollectionViewPrepare()
    func subCategoryCollectionViewRealoaData()

    
}

//MARK: PresenterToInteractorSubCategoryProtocol
protocol PresenterToInteractorSubCategoryProtocol {
    
}

//MARK: InteractorToPresenterSubCategoryProtocol
protocol InteractorToPresenterSubCategoryProtocol{
    
}

//MARK: PresenterToRouterSubCategoryProtocol
protocol PresenterToRouterSubCategoryProtocol {}
    
