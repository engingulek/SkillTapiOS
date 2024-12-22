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
    func cellForItem(indexPath:IndexPath) -> CategoryData
    
    func sizeForItem(width:CGFloat,
                     height:CGFloat) -> CGSize
    
    func insetForSection() -> (top:CGFloat,
                                      left:CGFloat,
                                      right:CGFloat,
                                      bottom:CGFloat)
    
    func onTappedMessageIcon()
    
    
    
    
}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol : AnyObject,HomeKits{
    func setSearchConfigureView(searchLigtLabelText:String)
    func setCategoryTitleLabel(title:String)

    func setHeadData(title:String,subtitle:String)
    
    func categoriesCollectioViewPreapare()
    func categoriesCollectionViewRealoadData()
    func createErrorMessageForCategories(message:String)
    
    func startLoadignAnimation()
    func stopLoadingAnimation()
    

    
}

//MARK: PresenterToInteractorHomeProtocol
protocol PresenterToInteractorHomeProtocol {
    func fetchCategories() async
}

//MARK: InteractorToPresenterHomeProtocol
protocol InteractorToPresenterHomeProtocol{
    func sendCategories(categories:[CategoryData])
    func sendError()
}

//MARK: PresenterToRouterHomeProtocol
protocol PresenterToRouterHomeProtocol {
    func toSearchView(view:PresenterToViewHomeProtocol?)
    func toRoomList(view:PresenterToViewHomeProtocol?)
}
