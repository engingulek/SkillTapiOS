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
    case categories = "Categories"
    case subCategoriesNavTitle = "Sub Categories"
    case freelancerDetail = "Freelancer Detail"
    case advertDetailNav = "Advert Detail"
    case lastMessageList = "Last Message List"
    case sendMessage = "Send Message"
    case hi = "Hi"
    case errorMessage = "Something Went Wrong"
    case packageIncluded = "Package Included"
    
    var text : String {
        return self.rawValue
    }
}
