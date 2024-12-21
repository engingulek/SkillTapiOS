//
//  FirebaseManager.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation
import FirebaseDatabase

enum FirebaseError :  Error {
    case notFound
}


struct SetValueResult:Decodable{
    let name:String
}

protocol FirebaseManagerProtocol {
    func fetch(
        target: FirebasePath,
        completion: @escaping (Result<[String:AnyObject], FirebaseError>) -> Void
    )
    
   func set(
    target:FirebaseSetPath,
    value:[String:Any],
    completion: @escaping (Result<String, FirebaseError>) -> Void
    
   )
    
    func update(
        target:FirebaseSetPath,
        value:[String:Any],
completion: @escaping (Result<String, FirebaseError>) -> Void)
}

class FirebaseManager: FirebaseManagerProtocol {
    
  
    func fetch(target: FirebasePath,
               completion: @escaping (Result<[String:AnyObject], FirebaseError>) -> Void) {
        let ref = target.path
        ref.observe(.value) { snaphshot,_  in
            guard let value = snaphshot.value as? [String:AnyObject]
            else {
                completion(.failure(.notFound))
                return
            }
            completion(.success(value))
        }
    }
    
    func set(target: FirebaseSetPath, 
             value:[String:Any],
             completion: @escaping (Result<String, FirebaseError>) -> Void) {
        
        let ref = target.path
        ref.setValue(value){error,result in
            guard error != nil else {
                completion(.failure(.notFound))
                return}
            
            completion(.success("success"))
            
          
        }
    }
    
    func update(target: FirebaseSetPath, 
                value: [String : Any],
                completion: @escaping (Result<String, FirebaseError>) -> Void) {
        let ref = target.path
        
        ref.updateChildValues(value){error,_ in
            guard error != nil else {
                completion(.failure(.notFound))
                return}
            completion(.success("success"))
        }
        
    }
    
    
    
}

