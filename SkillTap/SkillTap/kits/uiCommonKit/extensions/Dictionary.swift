//
//  Dictionary.swift
//  SkillTap
//
//  Created by Engin Gülek on 20.12.2024.
//

import Foundation

import Foundation

extension Dictionary {
    /// Decodes a dictionary into a specified Decodable model
    /// - Parameter type: The type of the model to decode into
    /// - Returns: An instance of the decoded model, or `nil` if an error occurs
    func decode<T: Decodable>(to type: T.Type) -> T? {
        do {
          
            let data = try JSONSerialization.data(withJSONObject: self, options: [])
            
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
          
            print("Error decoding JSON to \(T.self): \(error)")
            return nil
        }
    }
}

