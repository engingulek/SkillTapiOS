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
    
}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol : AnyObject,HomeKits{
    func setConfigureView(searchLigtLabelText:String)
    
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
