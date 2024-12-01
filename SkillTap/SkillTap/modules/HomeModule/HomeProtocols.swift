//
//  HomeProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

typealias HomeKits = UIViewAble

//MARK: ViewToPrensenterHomeProtocol
protocol ViewToPrensenterHomeProtocol{
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    
    func onTappedSearchBar()
    
    func topOptionsNumberOfItemsIn() -> Int
    func topCellForItem(indexPath:IndexPath) -> (
        topOption:String,
        borderColor:String,
        textColor:String
    )
    
}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol : AnyObject,HomeKits{
    func setSearchConfigureView(searchLigtLabelText:String)
    func setFindFreelancerBanner(
        title:String,
        imageUrl:String,
        subTitle:String)
    
    func setAdvertBanner(
        title:String,
        imageUrl:String,
        subTitle:String)
    
    func topOptionsCollectionViewPrepare()
    func topOptionsCollectionViewReloadData()
    func setHeadData(title:String,subtitle:String)
    
}

//MARK: PresenterToInteractorHomeProtocol
protocol PresenterToInteractorHomeProtocol {
    
}

//MARK: InteractorToPresenterHomeProtocol
protocol InteractorToPresenterHomeProtocol{
    
}

//MARK: PresenterToRouterHomeProtocol
protocol PresenterToRouterHomeProtocol {
    
}