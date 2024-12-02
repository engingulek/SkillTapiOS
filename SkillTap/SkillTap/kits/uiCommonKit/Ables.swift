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


//MARK: - SegueAble
public protocol SegueAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
    func popViewControllerAble()
}

extension SegueAble  where Self : UIViewController{
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    public func popViewControllerAble(){
        navigationController?.popViewController(animated: true)
    }
}



//MARK: - NavConUIAble
public protocol NavConUIAble {
    func changeTitle(title:String)
}

extension NavConUIAble where Self :  UIViewController{
    
    public func changeTitle(title:String) {
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = UIColor(hex: ColorTheme.primaryTextColor.rawValue)
    }
    
}
