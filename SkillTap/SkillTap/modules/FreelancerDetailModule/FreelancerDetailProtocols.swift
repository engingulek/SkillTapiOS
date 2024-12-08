//
//  FreelancerProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

typealias FreelancerKits = UIViewAble  & NavConUIAble

//MARK: ViewToPrensenterFreelancerDetailProtocol
protocol ViewToPrensenterFreelancerDetailProtocol{
    var view : PresenterToViewFreelancerDetailProtocol? {get}
    func viewDidLoad()
    func sizeForItemAt(
                       width:CGFloat,
                       height:CGFloat) -> CGSize
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath)
  
   
        
}

//MARK: PresenterToViewFreelancerDetailProtocol
protocol PresenterToViewFreelancerDetailProtocol : AnyObject,SearchKits{
    func advertsColllectionViewPrepare()
    func advertsCollectionViewReloadData()
    func freelancerInfoViewData()
    func freelancerViewData(title:String)
    
  
}

//MARK: PresenterToInteractorFreelancerDetailProtocol
protocol PresenterToInteractorFreelancerDetailProtocol{
    
}

//MARK: InteractorToPresenterFreelancerDetailProtocol
protocol InteractorToPresenterFreelancerDetailProtocol{
    
}

//MARK: PresenterToRouterFreelancerDetailProtocol
protocol PresenterToRouterFreelancerDetailProtocol {
  
}
