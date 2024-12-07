//
//  FreelancerProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation

typealias FreelancerKits = UIViewAble  & NavConUIAble

//MARK: ViewToPrensenterFreelancerProtocol
protocol ViewToPrensenterFreelancerProtocol{
    var view : PresenterToViewFreelancerProtocol? {get}
    func viewDidLoad()
  
   
        
}

//MARK: PresenterToViewFreelancerProtocol
protocol PresenterToViewFreelancerProtocol : AnyObject,SearchKits{
    
  
}

//MARK: PresenterToInteractorFreelancerProtocol
protocol PresenterToInteractorFreelancerProtocol{
    
}

//MARK: InteractorToPresenterFreelancerProtocol
protocol InteractorToPresenterFreelancerProtocol{
    
}

//MARK: PresenterToRouterFreelancerProtocol
protocol PresenterToRouterFreelancerProtocol {
  
}
