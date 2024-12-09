//
//  AdvertListProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation


typealias AdvertListKits = UIViewAble & NavConUIAble

//MARK: ViewToPrensenterAdvertListProtocol
protocol ViewToPrensenterAdvertListProtocol{
    var view : PresenterToViewAdvertListProtocol? {get}
    func viewDidLoad()
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath)
    func sizeForItemAt(width:CGFloat,
                       height:CGFloat) -> CGSize
    
}

//MARK: PresenterToViewAdvertListProtocol
protocol PresenterToViewAdvertListProtocol : AnyObject,SubCategoryKits{
 
    func advertListCollectionViewPrepare()
    func advertListCollectionViewRealoaData()

    
}

//MARK: PresenterToInteractorAdvertListProtocol
protocol PresenterToInteractorAdvertListProtocol {
    
}

//MARK: InteractorToPresenterAdvertListProtocol
protocol InteractorToPresenterAdvertListProtocol{
    
}

//MARK: PresenterToRouterAdvertListProtocol
protocol PresenterToRouterAdvertListProtocol {
    
}

