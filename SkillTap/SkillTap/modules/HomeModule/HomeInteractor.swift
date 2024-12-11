//
//  HomeInteractor.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

class HomeInteractor :  PresenterToInteractorHomeProtocol {
    var presenter : InteractorToPresenterHomeProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    func fetchCategories() async throws {
        do{
            let response = try await networkManager.fetch(target: .categories, responseClass: [CategoryData].self)
            presenter?.sendCategories(categories:response)
        }catch{
            throw error
        }
    }
}
