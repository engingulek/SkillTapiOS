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



protocol FirebaseManagerProtocol {
    func fetch(
        target: FirebasePath,
        completion: @escaping (Result<[String:AnyObject], FirebaseError>) -> Void
    )
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
}


/*protocol FirebaseManagerProtocol {
 func fetch<T>(
 target:FirebasePath,
 type:T.Type
 )
 }
 
 
 class FirebaseManager :  FirebaseManagerProtocol {
 func fetch<T>(target: FirebasePath,
 type: T.Type
 
 )  {
 let ref = target.path
 
 ref.observe(.value) { snapshot in
 guard let value = snapshot.value as? T else {return}
 print("Manager \(value)")
 }
 
 
 
 }
 
 }*/
