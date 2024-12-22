//
//  MockSearchInteractor.swift
//  SkillTapTests
//
//  Created by Engin Gülek on 14.12.2024.
//

import Foundation
import UIKit
@testable import SkillTap


class MockSearchInteractor : PresenterToInteractorSearchProtocol {
  
    
    var adverts : [Advert] = []
    var freelancer : [Freelancer] = []
    
    func fetchAllAdverts() async {
        
    }
    
    func fetchAllFreelancers() async {
        
    }
}
