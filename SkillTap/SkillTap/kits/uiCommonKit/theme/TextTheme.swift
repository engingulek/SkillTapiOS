//
//  TextTheme.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import Foundation

enum TextTheme:String {
    case homeNavTitle = "Home"
    case searchNavTitle = "Search"
    case searchplaceholder = "What you are looking for is here"
    case adverts = "Adverts"
    case freelancers = "Freelancers"
    
    var text : String {
        return self.rawValue
    }
}