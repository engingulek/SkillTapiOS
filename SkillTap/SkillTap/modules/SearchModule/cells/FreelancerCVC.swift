//
//  FreelancerCVC.swift
//  SkillTap
//
//  Created by Engin Gülek on 2.12.2024.
//

import UIKit

class FreelancerCVC: UICollectionViewCell {
    static let identifier : String  = "freelancerCellIdenfier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
