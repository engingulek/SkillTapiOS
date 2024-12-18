//
//  HomePresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

final class HomePresenter {
    weak var view: PresenterToViewHomeProtocol?
    private var router : PresenterToRouterHomeProtocol
    private let interactor : PresenterToInteractorHomeProtocol
    private var categoryList : [CategoryData] = []
    
    init(view: PresenterToViewHomeProtocol?,
         router:PresenterToRouterHomeProtocol,
         interactor : PresenterToInteractorHomeProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    private func fetchCategories() async {
        view?.startLoadignAnimation()
        await interactor.fetchCategories()
        view?.stopLoadingAnimation()
        view?.categoriesCollectionViewRealoadData()
        
    }
}

//MARK: ViewToPrensenterHomeProtocol
extension HomePresenter : ViewToPrensenterHomeProtocol {

    func viewDidLoad() {
        view?.setBackColorAble(color:ColorTheme.secondaryColor.color)
        view?.setSearchConfigureView(searchLigtLabelText: TextTheme.searchplaceholder.text)
        view?.setCategoryTitleLabel(title: TextTheme.categories.text)
        
        view?.setHeadData(title: TextTheme.hi.text, subtitle:TextTheme.searchplaceholder.text)
    
        view?.changeTitle(title: TextTheme.homeNavTitle.text)
        view?.categoriesCollectioViewPreapare()
        
        
        Task {
            await fetchCategories()
        }
        
    }
    
    func onTappedSearchBar() {
        router.toSearchView(view: view)
    }
    
    func numberOfItemsIn() -> Int {
        return categoryList.count
      
    }
    
    func cellForItem(indexPath: IndexPath) -> CategoryData {
        let category = categoryList[indexPath.item]
        return category
        
    }
    
    func sizeForItem(
                     width: CGFloat,
                     height: CGFloat) -> CGSize {
        return CGSize(width: width / 2.5, height: height / 3.5)
    }
    
    func insetForSection() -> (
        top: CGFloat,
        left: CGFloat,
        right: CGFloat,
        bottom: CGFloat) {
            return (top:5,left:10,right:10,bottom:5)
        
    }
    
    
    func onTappedMessageIcon() {
        router.toLastMessageList(view: view)
    }
    
   

}

//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter : InteractorToPresenterHomeProtocol {

    func sendCategories(categories: [CategoryData]) {
        categoryList = categories
    }
    
    
    func sendError() {
        categoryList = []
        view?.createErrorMessageForCategories(message: TextTheme.errorMessage.text)
        view?.stopLoadingAnimation()
        view?.categoriesCollectionViewRealoadData()
    }
    
}
