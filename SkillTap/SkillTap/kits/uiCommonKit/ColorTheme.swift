//
//  ColorTheme.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation

enum ColorTheme : String {
    
    /// is white
    case appBackColor  = "#FFFFFF"
    
    // is black
    case primaryTextColor = "#000000"
    
    var color : String {
        return self.rawValue
    }
}


