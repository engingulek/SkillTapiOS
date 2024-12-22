//
//  UICollectionView+Extensions.swift
//  SkillTap
//
//  Created by Engin Gülek on 1.12.2024.
//

import Foundation

import UIKit

extension UICollectionView {
     static func primaryCollectionView(tag:Int = 0,scroolDirection:UICollectionView.ScrollDirection) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
       layout.scrollDirection = scroolDirection
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.tag = tag
         
        return collectionView
    }
}
