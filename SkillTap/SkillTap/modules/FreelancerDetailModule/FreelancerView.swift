//
//  FreelancerVierw.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
import SnapKit
class FreelancerView : BaseView<FreelancerDetailViewController> {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private lazy var freelancerInfoView = FreelancerInfoView()
    override func setupView() {
        super.setupView()
        configureView()
    }
    
    
    private func configureView(){
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
      
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
      
        contentView.addSubview(freelancerInfoView)
        
       
        freelancerInfoView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
        }
        
      
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(freelancerInfoView.snp.bottom).offset(20)
        }
    }
    
    
    func configureFreelancerInfoData(){
        freelancerInfoView.configureData()
    }
}
