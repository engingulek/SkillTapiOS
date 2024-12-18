//
//  AdvertDetail.swift
//  SkillTap
//
//  Created by Engin Gülek on 18.12.2024.
//

import Foundation


// MARK: - AdvertDetail
struct AdvertDetail: Decodable {
    let id: Int
    let image: String
    let freelancer: FreelancerOnAdvertDetail
    let packages: [Package]
}

// MARK: - FreelancerOnAdvertDetail
struct FreelancerOnAdvertDetail: Decodable {
    let id: Int
    let imageURL: String
    let title, subTitle, detail: String
}

// MARK: - Package
struct Package: Decodable {
    let id: Int
    let title, packageType, detail: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id, title
        case packageType = "package_type"
        case detail, price
    }
}
