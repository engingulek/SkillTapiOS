//
//  SearchPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

enum SearchType{
    case adverts
    case freelancer
}

import Foundation

final class SearchPresenter {
    weak var view : PresenterToViewSearchProtocol?
    private var selectedSearchType : SearchType = .adverts
    init(view: PresenterToViewSearchProtocol?) {
        self.view = view
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
        }
    }

}

//MARK: InteractorToPresenterSearchProtocol
extension SearchPresenter : InteractorToPresenterSearchProtocol {
    
}
