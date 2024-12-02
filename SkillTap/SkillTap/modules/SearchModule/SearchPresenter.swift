//
//  SearchPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

enum SearchType{
    case adverts
    case freelancer
    case none
}

import Foundation

final class SearchPresenter {
    weak var view : PresenterToViewSearchProtocol?
    private var selectedSearchType : SearchType = .adverts
    init(view: PresenterToViewSearchProtocol?) {
        self.view = view
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
        view?.advertsCollectionViewReload()
        view?.freelancerCollectionViewPrepare()
        view?.freelancerCollectionViewReload()
    }
    
    func onChangedSearctTextField(text: String?) {
       
    }
    
    func onTappedAdvertsButton() {
        selectedSearchType = .adverts
        changeButtonsDesign(selectedSearchType)
    }
    
    func onTappedFreelancerButton() {
        selectedSearchType = .freelancer
        changeButtonsDesign(selectedSearchType)
    }
    

    
    func numberOfItems() -> Int {
        return selectedSearchType == .adverts ? 10 : 5
    }
    
    func cellForItem(selectedType:SearchType,at indexPath: IndexPath) {
       
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

}

//MARK: InteractorToPresenterSearchProtocol
extension SearchPresenter : InteractorToPresenterSearchProtocol {
    
}
