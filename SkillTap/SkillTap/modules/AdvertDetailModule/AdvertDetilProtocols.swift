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
    func fetchAdvertDetail(id:Int)

  
   
        
}

//MARK: PresenterToViewAdvertDetailProtocol
protocol PresenterToViewAdvertDetailProtocol: AnyObject,SearchKits{
   
    func getAdvertDetail(detail:(baseImageUrl:String,freelancer:FreelancerOnAdvertDetail)?, errorState: Bool)
    func getAdvertPackage(package:Package)
  
}

//MARK: PresenterToInteractorAdvertDetailProtocol
protocol PresenterToInteractorAdvertDetailProtocol{
    func fetchAdvertDetail(id:Int) async
}

//MARK: InteractorToPresenterAdvertDetailProtocol
protocol InteractorToPresenterAdvertDetailProtocol{
    func sendAdvertDetail(_ advertDetail:AdvertDetail?)
}

//MARK: PresenterToRouterAdvertDetailProtocol
protocol PresenterToRouterAdvertDetailProtocol {
    func toMessage(view:PresenterToViewAdvertDetailProtocol?)
}
