//
//  ColorTheme.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

enum ColorTheme : String {
    
    /// is white
    case secondaryColor  = "#FFFFFF"
    
    /// is black
    case primaryColor = "#000000"
    
    /// is red
    case thirdColor = "#FF0000"
    
    case ratingColor = "#FCC737"
    
    case lightBackColor = "#E4E0E1"
    
    var color : String {
        return self.rawValue
    }
}


