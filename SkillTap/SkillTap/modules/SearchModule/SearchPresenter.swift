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
    private var searchText : String = ""
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
    
    private func fetchSearchAdvert() async {
        await interactor.fetchAllAdverts()
        view?.advertsCollectionViewReload()
        
    }
    
}

//MARK: ViewToPrensenterSearchProtocol
extension SearchPresenter : ViewToPrensenterSearchProtocol {

  
 
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.changeTitle(title: TextTheme.searchNavTitle.text)
        view?.setSearchTextFieldPlaceholder(TextTheme.searchplaceholder.text)
        
        view?.setAdvertsButtonDesign(text: TextTheme.adverts.text,
                                     textColor: ColorTheme.secondaryColor.color,
                                     backColor: ColorTheme.thirdColor.color,
                                     borderColor: ColorTheme.thirdColor.color
                        
        )
        
        view?.setFreelancerButtonDesign(text: TextTheme.freelancers.text,
                                     textColor: ColorTheme.thirdColor.color,
                                     backColor: ColorTheme.secondaryColor.color,
                                        borderColor: ColorTheme.thirdColor.color)
        
        view?.advertsCollectionViewPrepare()
        
        view?.freelancerCollectionViewPrepare()
        view?.freelancerCollectionViewReload()
        view?.createSearchIconWhenOpenPage(isHidden: false)
        
        Task{
           await fetchSearchAdvert()
        }
        
     
        
    }
    
    
    private func searchAdverts(){
        
        searchAdvertList = tempAdvertList.filter({ $0.detail.lowercased().contains(searchText.lowercased()) })
        if searchAdvertList.isEmpty {
            view?.createSearchIconWhenOpenPage(isHidden: false)
        }else{
            view?.createSearchIconWhenOpenPage(isHidden: true)
        }
        view?.advertsCollectionViewReload()
        
    }
    
    func onChangedSearctTextField(text: String?) {
        guard let text = text else {return}
        searchText = text
        switch selectedSearchType {
        case .adverts:
            searchAdverts()
        case .freelancer:
            return
        case .none:
            searchAdvertList = []
        }
        
        
    }
    
    func onTappedAdvertsButton() {
        selectedSearchType = .adverts
        changeButtonsDesign(selectedSearchType)
        searchAdverts()
    }
    
    func onTappedFreelancerButton() {
        selectedSearchType = .freelancer
        changeButtonsDesign(selectedSearchType)
    }
    

    
    func numberOfItems() -> Int {
        return selectedSearchType == .adverts ? searchAdvertList.count : 0
    }
    
    func cellForItem(at indexPath: IndexPath) -> (advert:Advert,()) {
        let advert = searchAdvertList[indexPath.item]
        return (advert,())
       
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
            router.toAdvertDetail(view: view)
        case .freelancer:
            router.toFreelancerDetail(view: view)
        case .none:
            return
        }
    }

}

//MARK: InteractorToPresenterSearchProtocol
extension SearchPresenter : InteractorToPresenterSearchProtocol {
  
    
    func sendAdverts(adverts: [Advert]) {
        tempAdvertList = adverts
    }
    
    func sendError(error: Error) {
        
    }
    
  
    
    
    
}
