//
//  SearchInteractoır.swift
//  SkillTap
//
//  Created by Engin Gülek on 14.12.2024.
//

import Foundation

class SearchInteractor : PresenterToInteractorSearchProtocol {
 
    var presenter : InteractorToPresenterSearchProtocol?
    private let newtorkManager :  NetworkManagerProtocol = NetworkManager()
    
    func fetchAllAdverts() async  {
        do{
            let response = try await newtorkManager.fetch(target: .adverts, responseClass: [Advert].self)
            presenter?.sendAdverts(adverts: response)
            
        }catch{
            presenter?.sendError(error: error)
        }
    }
    
    
    func fetchAllFreelancers() async {
        do{
            let response = try await newtorkManager.fetch(target: .feelancer, responseClass: [Freelancer].self)
            presenter?.sendFreelancr(freelancers: response)
            
        }catch{
            presenter?.sendError(error: error)
        }

    }
    
    
}
