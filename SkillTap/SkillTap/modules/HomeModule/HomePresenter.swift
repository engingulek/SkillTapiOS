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
    init(view: PresenterToViewHomeProtocol?,router:PresenterToRouterHomeProtocol) {
        self.view = view
        self.router = router
    }
    
}


//MARK: ViewToPrensenterHomeProtocol
extension HomePresenter : ViewToPrensenterHomeProtocol {

    func viewDidLoad() {
        view?.setBackColorAble(color:ColorTheme.secondaryColor.color)
        view?.setSearchConfigureView(searchLigtLabelText: TextTheme.searchplaceholder.text)
        view?.setCategoryTitleLabel(title: TextTheme.categories.text)
        
        view?.setHeadData(title: "Hi,Engin", subtitle:TextTheme.searchplaceholder.text)
    
        view?.changeTitle(title: TextTheme.homeNavTitle.text)
        view?.categoriesCollectioViewPreapare()
        view?.categoriesCollectionViewRealoadData()
        
    }
    
    func onTappedSearchBar() {
        router.toSearchView(view: view)
    }
    
    func numberOfItemsIn(tag:Int) -> Int {
        return 3
      
    }
    
    func cellForItem(indexPath: IndexPath) -> (topOption: String,
                                                  borderColor:String,
                                                  textColor:String) {
        return (topOption:"test",
                borderColor:ColorTheme.primaryColor.color,
                textColor:ColorTheme.primaryColor.color
        )
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
    
    func didSelectItem( at indexPath: IndexPath) {
        router.toSubCategoryView(view: view)
    }
    
    func onTappedMessageIcon() {
        router.toLastMessageList(view: view)
    }


}

//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter : InteractorToPresenterHomeProtocol {
    
}
