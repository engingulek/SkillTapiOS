//
//  AdvertListPresenter.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation

final class AdvertListPresenter {
    weak var view : PresenterToViewAdvertListProtocol?
    init(view: PresenterToViewAdvertListProtocol?) {
        self.view = view
    }
}



//MARK: ViewToPresenterAdvertListProtocol
extension AdvertListPresenter : ViewToPrensenterAdvertListProtocol {
   
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.secondaryColor.color)
        view?.changeTitle(title: TextTheme.adverts.rawValue)
    }
    
    func numberOfItemsIn() -> Int {
        return 5
    }
    
    func cellForItem(at indexPath: IndexPath) {
        
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width - 10, height: height / 4)
    }
}


//MARK: InteractorToPresenterAdvertListProtocol
extension AdvertListPresenter : InteractorToPresenterAdvertListProtocol {
    
}
