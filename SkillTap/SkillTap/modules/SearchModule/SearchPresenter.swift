//
//  SearchPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import Foundation

enum SearchType{
    case adverts
    case freelancer
    case none
}

final class SearchPresenter {
    weak var view : PresenterToViewSearchProtocol?
    private var selectedSearchType : SearchType = .adverts
    private var router : PresenterToRouterSearchProtocol
    private let interactor : PresenterToInteractorSearchProtocol
    private var tempAdvertList : [Advert] = []
    private var searchAdvertList : [Advert] = []
    private var tempFreelancerList : [Freelancer] = []
    private var searchFreelancerList : [Freelancer] = []
    
    init(view: PresenterToViewSearchProtocol?,
         router:PresenterToRouterSearchProtocol,
         interactor:PresenterToInteractorSearchProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    private func changeButtonsDesign(_ selectedSearchType:SearchType){
        
        switch selectedSearchType {
        case .adverts:
            view?.setAdvertsButtonDesign(text: TextTheme.adverts.text,
                                         textColor: ColorTheme.secondaryColor.color,
                                         backColor: ColorTheme.thirdColor.color,
                                         borderColor: ColorTheme.thirdColor.color
                                         
            )
            
            view?.setFreelancerButtonDesign(text: TextTheme.freelancers.text,
                                            textColor: ColorTheme.thirdColor.color,
                                            backColor: ColorTheme.secondaryColor.color,
                                            borderColor: ColorTheme.thirdColor.color)
            
            
        case .freelancer:
            view?.setFreelancerButtonDesign(text: TextTheme.freelancers.text,
                                            textColor: ColorTheme.secondaryColor.color,
                                            backColor: ColorTheme.thirdColor.color,
                                            borderColor: ColorTheme.thirdColor.color
                                            
            )
            
            view?.setAdvertsButtonDesign(text: TextTheme.adverts.text,
                                         textColor: ColorTheme.thirdColor.color,
                                         backColor: ColorTheme.secondaryColor.color,
                                         borderColor: ColorTheme.thirdColor.color)
            
        case .none:
            view?.setAdvertsButtonDesign(text: TextTheme.adverts.text,
                                         textColor: ColorTheme.secondaryColor.color,
                                         backColor: ColorTheme.thirdColor.color,
                                         borderColor: ColorTheme.thirdColor.color
                                         
            )
            
            view?.setFreelancerButtonDesign(text: TextTheme.freelancers.text,
                                            textColor: ColorTheme.thirdColor.color,
                                            backColor: ColorTheme.secondaryColor.color,
                                            borderColor: ColorTheme.thirdColor.color)
            
        }
    }
    
    private func fetchAllAdvert() async {
        await interactor.fetchAllAdverts()
    }
    
    private func fetchAllFreelancer() async {
        await interactor.fetchAllFreelancers()
    }
    
}

//MARK: ViewToPrensenterSearchProtocol
extension SearchPresenter : ViewToPrensenterSearchProtocol {
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.changeTitle(title: TextTheme.searchNavTitle.text)
        view?.setSearchTextFieldPlaceholder(TextTheme.searchplaceholder.text)
        
        changeButtonsDesign(.adverts)
        
        view?.advertsCollectionViewPrepare()
        
        view?.freelancerCollectionViewPrepare()
        
        
        Task{
            await fetchAllAdvert()
            await fetchAllFreelancer()
            
        }
    }
    
    
    private func searchAdverts(searchText:String){
        
        searchAdvertList = tempAdvertList.filter({
            $0.detail.lowercased()
            .contains(searchText.lowercased()) })
        
        view?.advertsCollectionViewReload()
    }
    
    private func searchFreelancer(searchText:String){
        searchFreelancerList = tempFreelancerList.filter({
            $0.title.lowercased()
            .contains(searchText.lowercased()) })
        
        view?.freelancerCollectionViewReload()
    }
    
    func onChangedSearctTextField(text: String?) {
        guard let text = text else {return}
        
        searchAdverts(searchText: text)
        searchFreelancer(searchText: text)
        
    }
    
    func onTappedAdvertsButton() {
        selectedSearchType = .adverts
        changeButtonsDesign(selectedSearchType)
        
    }
    
    func onTappedFreelancerButton() {
        selectedSearchType = .freelancer
        changeButtonsDesign(selectedSearchType)
        
    }
    
    
    func numberOfItems(searchType:SearchType) -> Int {
        switch searchType {
        case .adverts:
            return searchAdvertList.count
        case .freelancer:
            return searchFreelancerList.count
        case .none:
            return 0
        }
    }
    
    func cellForItemAdvert(at indexPath: IndexPath) -> Advert {
        let advert = searchAdvertList[indexPath.item]
        return advert
    }
    
    func cellForItemFreelancer(at indexPath: IndexPath) -> Freelancer {
        let freelancer = searchFreelancerList[indexPath.item]
        return freelancer
    }
    
    func sizeForItemAt(selectedType: SearchType,
                       width: CGFloat,
                       height: CGFloat) -> CGSize {
        
        switch selectedType {
        case .adverts:
            return CGSize(width: width - 10, height: height / 4)
        case .freelancer:
            return CGSize(width: width - 10, height: height / 6)
        case .none:
            return CGSize(width: 0, height: 0)
        }
        
    }
    func didSelectItem(selectedType: SearchType, at indexPath: IndexPath) {
        switch selectedType {
        case .adverts:
            let advertId = searchAdvertList[indexPath.item].id
            router.toAdvertDetail(view: view,id: advertId)
        case .freelancer:
            let freelancerId = searchFreelancerList[indexPath.item].id
            router.toFreelancerDetail(view: view,id: freelancerId)
        case .none:
            return
        }
    }
    
}

//MARK: InteractorToPresenterSearchProtocol
extension SearchPresenter : InteractorToPresenterSearchProtocol {
    
    func sendAdverts(adverts: [Advert]) {
        tempAdvertList = adverts
        searchAdvertList = tempAdvertList
        view?.advertsCollectionViewReload()
        view?.freelancerCollectionViewReload()
        
    }
    
    
    
    func sendFreelancr(freelancers: [Freelancer]) {
        tempFreelancerList = freelancers
        searchFreelancerList = tempFreelancerList
        view?.freelancerCollectionViewReload()
    }
}
