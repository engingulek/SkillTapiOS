//
//  LastMessageListPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation

final class LastMessageListPresenter {
    weak var view : PresenterToViewLastMessageListProtocol?
    private var router : PresenterToRouterLastMessageListProtocol
    init(view: PresenterToViewLastMessageListProtocol?,router : PresenterToRouterLastMessageListProtocol) {
        self.view = view
        self.router = router
    }
}


//MARK: ViewToPrensenterLastMessageListProtocol
extension LastMessageListPresenter : ViewToPrensenterLastMessageListProtocol {
    func viewDidLoad() {
        view?.changeTitle(title: TextTheme.lastMessageList.text)
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.lastMessageListCollectionViewPrepare()
        view?.lastMessageListCollectionViewRealoaData()
    }
    
    func numberOfItemsIn() -> Int {
        return 10
    }
    
    func cellForItem(at indexPath: IndexPath) {
        
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        router.toMessage(view: view)
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width, height:  height / 12)
    }
    
}

//MARK: InteractorToPresenterLastMessageListProtocol
extension LastMessageListPresenter  : InteractorToPresenterLastMessageListProtocol {
    
}
