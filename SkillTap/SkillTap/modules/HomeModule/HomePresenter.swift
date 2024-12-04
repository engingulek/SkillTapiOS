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
        view?.topOptionsCollectionViewPrepare()
        view?.topOptionsCollectionViewReloadData()
        view?.setHeadData(title: "Hi,Engin", subtitle:TextTheme.searchplaceholder.text)
    
        view?.changeTitle(title: TextTheme.homeNavTitle.text)
        view?.categoriesCollectioViewPreapare()
        view?.categoriesCollectionViewRealoadData()
        
    }
    
    func onTappedSearchBar() {
        router.toSearchView(view: view)
    }
    
    func numberOfItemsIn(tag:Int) -> Int {
        switch tag{
        case 0:
        return 3
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func cellForItem(tag:Int,indexPath: IndexPath) -> (topOption: String,
                                                  borderColor:String,
                                                  textColor:String) {
        return (topOption:"test",
                borderColor:ColorTheme.primaryColor.color,
                textColor:ColorTheme.primaryColor.color
        )
    }
    
    func sizeForItem(tag: Int,
                     width: CGFloat,
                     height: CGFloat) -> CGSize {
        switch tag {
        case 0:
            return CGSize(width: width / 4, height: 40)
        case 1:
            return CGSize(width: width / 2.5, height: height / 3.5)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func insetForSection(tag:Int) -> (
        top: CGFloat,
        left: CGFloat,
        right: CGFloat,
        bottom: CGFloat) {
            switch tag {
            case 0:
                return (top:1,left:1,right:1,bottom:1)
            case 1:
                return (top:5,left:10,right:10,bottom:5)
            default:
                return  (top:0,left:0,right:0,bottom:0)
            }
        
    }
    
    func didSelectItem(tag: Int, at indexPath: IndexPath) {
        switch tag{
        case 0:
            print("Selected topSection \(indexPath)")
        case 1:
            print("Selected Category \(indexPath)")
        default:
            return
        }
    }
    
    


}

//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter : InteractorToPresenterHomeProtocol {
    
}
