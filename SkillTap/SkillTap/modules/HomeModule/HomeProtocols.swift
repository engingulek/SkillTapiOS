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
    
    func numberOfItemsIn() -> Int
    func cellForItem(indexPath:IndexPath) -> Category
    
    func sizeForItem(width:CGFloat,
                     height:CGFloat) -> CGSize
    
    func insetForSection() -> (top:CGFloat,
                                      left:CGFloat,
                                      right:CGFloat,
                                      bottom:CGFloat)
    
    func didSelectItem(at indexPath:IndexPath)
    
    func onTappedMessageIcon()
    
    
}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol : AnyObject,HomeKits{
    func setSearchConfigureView(searchLigtLabelText:String)
    func setCategoryTitleLabel(title:String)

    func setHeadData(title:String,subtitle:String)
    
    func categoriesCollectioViewPreapare()
    func categoriesCollectionViewRealoadData()
    

    
}

//MARK: PresenterToInteractorHomeProtocol
protocol PresenterToInteractorHomeProtocol {
    func fetchCategories() async throws
}

//MARK: InteractorToPresenterHomeProtocol
protocol InteractorToPresenterHomeProtocol{
    func sendCategories(categories:[Category])
}

//MARK: PresenterToRouterHomeProtocol
protocol PresenterToRouterHomeProtocol {
    func toSearchView(view:PresenterToViewHomeProtocol?)
    func toSubCategoryView(view:PresenterToViewHomeProtocol?)
    func toLastMessageList(view:PresenterToViewHomeProtocol?)
}
