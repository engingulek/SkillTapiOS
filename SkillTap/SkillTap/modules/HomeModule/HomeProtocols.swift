//
//  HomeProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

typealias HomeKits = UIViewAble & SegueAble & NavConUIAble

//MARK: ViewToPrensenterHomeProtocol
protocol ViewToPrensenterHomeProtocol{
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    
    func onTappedSearchBar()
    
    func numberOfItemsIn(tag:Int) -> Int
    func cellForItem(tag:Int,indexPath:IndexPath) -> (
        topOption:String,
        borderColor:String,
        textColor:String
    )
    
    func sizeForItem(tag:Int, width:CGFloat,
                     height:CGFloat) -> CGSize
    
    func insetForSection(tag:Int) -> (top:CGFloat,
                                      left:CGFloat,
                                      right:CGFloat,
                                      bottom:CGFloat)
    
    func didSelectItem(tag:Int,at indexPath:IndexPath)
    
    
}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol : AnyObject,HomeKits{
    func setSearchConfigureView(searchLigtLabelText:String)
    func setCategoryTitleLabel(title:String)

    func topOptionsCollectionViewPrepare()
    func topOptionsCollectionViewReloadData()
    func setHeadData(title:String,subtitle:String)
    
    func categoriesCollectioViewPreapare()
    func categoriesCollectionViewRealoadData()
    

    
}

//MARK: PresenterToInteractorHomeProtocol
protocol PresenterToInteractorHomeProtocol {
    
}

//MARK: InteractorToPresenterHomeProtocol
protocol InteractorToPresenterHomeProtocol{
    
}

//MARK: PresenterToRouterHomeProtocol
protocol PresenterToRouterHomeProtocol {
    func toSearchView(view:PresenterToViewHomeProtocol?)
}
