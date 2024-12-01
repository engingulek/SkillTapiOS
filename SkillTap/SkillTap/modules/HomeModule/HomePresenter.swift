//
//  HomePresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

final class HomePresenter {
    weak var view: PresenterToViewHomeProtocol?
    init(view: PresenterToViewHomeProtocol?) {
        self.view = view
    }
    
}


//MARK: ViewToPrensenterHomeProtocol
extension HomePresenter : ViewToPrensenterHomeProtocol {
    
    func viewDidLoad() {
        view?.setBackColorAble(color:ColorTheme.appBackColor.color)
        view?.setSearchConfigureView(searchLigtLabelText: "What do you need?")
        view?.setFindFreelancerBanner(title: "Find Freelancer",
                                imageUrl: "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/skillTap%2Ffreelancer.png?alt=media&token=04058200-9959-44ae-bc82-09cf9aa649ba",
                                subTitle: "120k Freelancer")
        
        view?.setAdvertBanner(title: "Adverts",
                                  imageUrl: "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/skillTap%2Fwork.png?alt=media&token=f5480e12-e40b-4545-a1ee-96951db3f7a2", subTitle: "5k adverts")
        view?.topOptionsCollectionViewPrepare()
        view?.topOptionsCollectionViewReloadData()
        view?.setHeadData(title: "Hi,Engin", subtitle: "What you are looking for is here")
    }
    
    func onTappedSearchBar() {
        print("on tapped")
    }
    
    func topOptionsNumberOfItemsIn() -> Int {
        return 3
    }
    
    func topCellForItem(indexPath: IndexPath) -> (topOption: String,    
                                                  borderColor:String,
                                                  textColor:String) {
        return (topOption:"test",
                borderColor:ColorTheme.primaryTextColor.color,
                textColor:ColorTheme.primaryTextColor.color
        )
    }
    


}

//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter : InteractorToPresenterHomeProtocol {
    
}
