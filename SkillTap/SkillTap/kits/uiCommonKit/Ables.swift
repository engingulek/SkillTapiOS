//
//  Ables.swift
//  SkillTap
//
//  Created by Engin Gülek on 30.11.2024.
//

import Foundation
import UIKit

//MARK: - UIViewAble
public protocol UIViewAble {
    func setBackColorAble(color:String)
}

extension UIViewAble where Self : UIViewController  {
    public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
    
}
