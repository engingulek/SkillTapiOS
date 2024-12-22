//
//  FreelancerDetail.swift
//  SkillTap
//
//  Created by Engin Gülek on 18.12.2024.
//

import Foundation

// MARK: - Welcome
struct FreelancerDetail: Decodable {
    let id: Int
    let imageURL: String
    let title, subTitle, detail: String
    let rating: Double
    let adverts: [Advert]
}

