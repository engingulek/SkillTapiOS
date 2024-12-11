//
//  MockHomeInteractor.swift
//  SkillTapTests
//
//  Created by Engin Gülek on 11.12.2024.
//

import Foundation
import UIKit
@testable import SkillTap

enum MockError: Error {
    case mockError
}
class MockHomeInteractor : PresenterToInteractorHomeProtocol {
    var categories : [CategoryData] = []
    let mockfetchCategoriesError:Bool = false
    func fetchCategories() async throws {
        if mockfetchCategoriesError{
            throw MockError.mockError
        }
    }
    
}
