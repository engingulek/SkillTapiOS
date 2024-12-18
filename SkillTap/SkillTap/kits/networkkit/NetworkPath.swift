//
//  NetworkPath.swift
//  SkillTap
//
//  Created by Engin Gülek on 11.12.2024.
//

import Foundation

import Alamofire
public enum NetworkPath{
    case categories
    case adverts
    case feelancer
    case advertDetail(Int)
}



extension NetworkPath : TargetType {
    var baseURL: String {
        return Constants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
        case .categories:
            return Constants.categories.rawValue + Constants.getAll.rawValue
        case .adverts:
            return Constants.adverts.rawValue + Constants.getAll.rawValue
        case .feelancer:
            return Constants.freelancer.rawValue + Constants.getAll.rawValue
        case .advertDetail(let id):
            return Constants.adverts.rawValue +
            Constants.advertDetail.rawValue + "?id=\(id)"
        }
    }
    
    var method: AlamofireMethod {
        switch self {
       
        default:
            return .GET
            
        }
    }
    
    var requestType: RequestType {
        switch self {
        default:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}

