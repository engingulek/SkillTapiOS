//
//  AdvertDetilProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation


typealias AdvertDetailKits = UIViewAble  & NavConUIAble

//MARK: ViewToPrensenterAdvertDetailProtocol
protocol ViewToPrensenterAdvertDetailProtocol{
    var view : PresenterToViewAdvertDetailProtocol? {get}
    func viewDidLoad()
    func packageSegmentedConrollerChanged(index:Int)
    func onTappedSendMessageButton()
  
   
        
}

//MARK: PresenterToViewAdvertDetailProtocol
protocol PresenterToViewAdvertDetailProtocol: AnyObject,SearchKits{
   
    
  
}

//MARK: PresenterToInteractorAdvertDetailProtocol
protocol PresenterToInteractorAdvertDetailProtocol{
    
}

//MARK: InteractorToPresenterAdvertDetailProtocol
protocol InteractorToPresenterAdvertDetailProtocol{
    
}

//MARK: PresenterToRouterAdvertDetailProtocol
protocol PresenterToRouterAdvertDetailProtocol {
    func toMessage(view:PresenterToViewAdvertDetailProtocol?)
}
