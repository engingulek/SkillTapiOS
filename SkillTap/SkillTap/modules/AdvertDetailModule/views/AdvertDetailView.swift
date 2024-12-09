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
    var presenter : ViewToPrensenterAdvertDetailProtocol?
    private lazy var advertBaseImage : UIImageView = UIImageView()
    private lazy var advertDetailInfoView = AdvertDetailInfoView()
    private lazy var packageIncludeTitleLabel : UILabel = UILabel.middleTitleLabel()
   private lazy var packageSegmentedControll: UISegmentedControl = {
        let items = ["Basis", "Standard", "Pro"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0

       control.backgroundColor = .white
        return control
    }()
    
    
    private lazy var packageDescView : UIView = UIView()
    private lazy var packageTitle:UILabel = UILabel.middleTitleLabel()
    private lazy var packagedescLabel : UILabel = UILabel.descUILabel()
    
    
    private lazy var sendMessageButton : UIButton = UIButton.messageButton(action:sendMessageAction )
    private lazy var sendMessageAction  : UIAction = UIAction { _ in
        self.presenter?.onTappedSendMessageButton()
    }

    override func setupView() {
        super.setupView()
        configureView()
        advertBaseImage.setImageWithKigfisher(with: "https://images.unsplash.com/photo-1620969427101-7a2bb6d83273?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        packageIncludeTitleLabel.text = "Package Included"
        packageTitle.text = "Package Title"
        packagedescLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        
        packageSegmentedControll.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)

      
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        presenter?.packageSegmentedConrollerChanged(index: selectedIndex)
    }
    
    private func configureView(){
   
        addSubview(advertBaseImage)
        advertBaseImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(180)
        }
        
        addSubview(advertDetailInfoView)
        
        
        advertDetailInfoView.snp.makeConstraints { make in
            make.top.equalTo(advertBaseImage.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(packageIncludeTitleLabel)
        packageIncludeTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(advertDetailInfoView.snp.bottom).offset(5)
        }
        
        addSubview(packageSegmentedControll)
        packageSegmentedControll.snp.makeConstraints { make in
            make.top.equalTo(packageIncludeTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(60)
            
        }
        
        packageDescView.backgroundColor = .white
        packageDescView.layer.cornerRadius = 10
        addSubview(packageDescView)
        packageDescView.snp.makeConstraints { make in
            make.top.equalTo(packageSegmentedControll.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        packageDescView.addSubview(packageTitle)
        packageTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        packageDescView.addSubview(packagedescLabel)
        packagedescLabel.snp.makeConstraints { make in
            make.top.equalTo(packageTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
           
        }
        packageDescView.addSubview(sendMessageButton)
        sendMessageButton.snp.makeConstraints { make in
            make.top.equalTo(packagedescLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
