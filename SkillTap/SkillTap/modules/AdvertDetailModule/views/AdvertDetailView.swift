//
//  AdvertsDetailView.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import Foundation
import UIKit
import SnapKit
class AdvertDetailView : BaseView<AdvertDetailViewController> {
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var advertBaseImage : UIImageView = UIImageView()
    private lazy var advertDetailInfoView = AdvertDetailInfoView()
    private lazy var portfolyoTitle: UILabel = UILabel.middleTitleLabel()
    override func setupView() {
        super.setupView()
        configureView()
        advertBaseImage.setImageWithKigfisher(with: "https://images.unsplash.com/photo-1620969427101-7a2bb6d83273?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        portfolyoTitle.text = "Protfolyo"
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
        
        contentView.addSubview(advertBaseImage)
        advertBaseImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(180)
        }
        
        contentView.addSubview(advertDetailInfoView)
        
        
        advertDetailInfoView.snp.makeConstraints { make in
            make.top.equalTo(advertBaseImage.snp.bottom).offset(-20)
            make.centerX.equalTo(contentView)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        contentView.addSubview(portfolyoTitle)
        portfolyoTitle.snp.makeConstraints { make in
            make.top.equalTo(advertDetailInfoView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(portfolyoTitle.snp.bottom).offset(10)
        }
        
    }
}
