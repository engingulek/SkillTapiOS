//
//  Freelancer.swift
//  SkillTap
//
//  Created by Engin Gülek on 14.12.2024.
//

import Foundation

struct Freelancer: Decodable {
    let id: Int
    let imageURL: String
    let title, subTitle, detail: String
    let rating: Double
}
