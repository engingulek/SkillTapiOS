//
//  Category.swift
//  SkillTap
//
//  Created by Engin Gülek on 11.12.2024.
//

import Foundation

struct CategoryData : Decodable {
    let id: Int
      let title: String
      let imageURL: String
      let advertCount, freelancerCount: Int
      let colorCode: String

      enum CodingKeys: String, CodingKey {
          case id, title, imageURL
          case advertCount = "advert_count"
          case freelancerCount = "freelancer_count"
          case colorCode = "color_code"
      }
}
