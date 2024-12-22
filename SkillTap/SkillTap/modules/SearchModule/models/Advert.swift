//
//  Advert.swift
//  SkillTap
//
//  Created by Engin Gülek on 14.12.2024.
//

import Foundation

struct Advert:Decodable {
    let id: Int
    let imageURL: String
    let title: String
    let price: Int
    let detail: String
    
}
