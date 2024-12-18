//
//  AdvertDetailInteractor.swift
//  SkillTap
//
//  Created by Engin Gülek on 18.12.2024.
//

import Foundation

class AdvertDetailInteractor : PresenterToInteractorAdvertDetailProtocol {
    var presenter : InteractorToPresenterAdvertDetailProtocol?
    private let newtorkManager :  NetworkManagerProtocol = NetworkManager()
    func fetchAdvertDetail(id: Int) async {
        do{
            let response = try await newtorkManager.fetch(target: .advertDetail(id), responseClass: AdvertDetail.self)
           
            presenter?.sendAdvertDetail(response)
        }catch{
           presenter?.sendAdvertDetail(nil)
          
        }
    }
}
