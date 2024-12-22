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
    func cellForItem(at indexPath:IndexPath) -> Advert
    func fetchFreelancerDetail(id:Int)
  
   
        
}

//MARK: PresenterToViewFreelancerDetailProtocol
protocol PresenterToViewFreelancerDetailProtocol : AnyObject,SearchKits{
    func advertsColllectionViewPrepare()
    func advertsCollectionViewReloadData()
    func freelancerConfigureData(freelancer:FreelancerDetail?,errorState:Bool)
  
    
    
  
}

//MARK: PresenterToInteractorFreelancerDetailProtocol
protocol PresenterToInteractorFreelancerDetailProtocol{
    func fetchFreelancerDetail(id:Int) async
}

//MARK: InteractorToPresenterFreelancerDetailProtocol
protocol InteractorToPresenterFreelancerDetailProtocol{
    func sendFreelancerDetail(_ freelancerDetail:FreelancerDetail?)
}

//MARK: PresenterToRouterFreelancerDetailProtocol
protocol PresenterToRouterFreelancerDetailProtocol {
  
}
