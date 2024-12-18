//
//  FreelancerDetailInteractor.swift
//  SkillTap
//
//  Created by Engin Gülek on 18.12.2024.
//

import Foundation

class FreelancerDetailInteractor : PresenterToInteractorFreelancerDetailProtocol {
  
    var presenter : InteractorToPresenterFreelancerDetailProtocol?
    private let newtorkManager :  NetworkManagerProtocol = NetworkManager()
    
    func fetchFreelancerDetail(id: Int) async {
        do{
            let response = try await newtorkManager.fetch(target: .freelancerDetail(id), responseClass: FreelancerDetail.self)
            presenter?.sendFreelancerDetail(response)
        }catch{
            presenter?.sendFreelancerDetail(nil)
        }
    }
    
    
}
