//
//  SearchProtocols.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import Foundation

typealias SearchKits = UIViewAble  & NavConUIAble & SegueAble

//MARK: ViewToPrensenterSearchProtocol
protocol ViewToPrensenterSearchProtocol{
    var view : PresenterToViewSearchProtocol? {get}
    func viewDidLoad()
    func onChangedSearctTextField(text:String?)
    func onTappedAdvertsButton()
    func onTappedFreelancerButton()
    
    func numberOfItems() -> Int
    func cellForItem(at indexPath:IndexPath) ->  (advert:Advert,())
    
    func sizeForItemAt(selectedType: SearchType,
                       width:CGFloat,
                       height:CGFloat) -> CGSize
    func didSelectItem(
        selectedType: SearchType,
        at indexPath:IndexPath)
    
   
   
        
}

//MARK: PresenterToViewSearchProtocol
protocol PresenterToViewSearchProtocol : AnyObject,SearchKits{
    
    func setSearchTextFieldPlaceholder(_ placeholder:String)
    func setAdvertsButtonDesign(text:String,
                                textColor:String,
                                backColor:String,
                                borderColor:String)
    func setFreelancerButtonDesign(
        text:String,
        textColor:String,
        backColor:String,
        borderColor:String)
    
    func advertsCollectionViewPrepare()
    func freelancerCollectionViewPrepare()
    
    func advertsCollectionViewReload()
    func freelancerCollectionViewReload()
    
    func createSearchIconWhenOpenPage(isHidden:Bool)
    
}

//MARK: PresenterToInteractorSearchProtocol
protocol PresenterToInteractorSearchProtocol {
    func fetchAllAdverts() async 
}

//MARK: InteractorToPresenterSearchProtocol
protocol InteractorToPresenterSearchProtocol{
    func sendAdverts(adverts:[Advert])
    func sendError(error:Error)
    
}

//MARK: PresenterToRouterSearchProtocol
protocol PresenterToRouterSearchProtocol {
    func toAdvertDetail(view:PresenterToViewSearchProtocol?)
    func toFreelancerDetail(view:PresenterToViewSearchProtocol?)
}
