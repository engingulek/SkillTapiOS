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
    private lazy var packagePriceLabel : UILabel = UILabel.middleTitleLabel(
        color: ColorTheme.thirdColor.color)
    private lazy var errorMessageLabel : UILabel = UILabel.erroeLabel()
    
    
    private lazy var sendMessageButton : UIButton = UIButton.messageButton(action:sendMessageAction )
    private lazy var sendMessageAction  : UIAction = UIAction { _ in
        self.presenter?.onTappedSendMessageButton()
    }

    override func setupView() {
        super.setupView()
        configureView()
       
        
        packageSegmentedControll.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)

        packageIncludeTitleLabel.text = TextTheme.packageIncluded.text
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
        packageDescView.layer.cornerRadius = CornerRadiusTheme.small.rawValue
        addSubview(packageDescView)
        packageDescView.snp.makeConstraints { make in
            make.top.equalTo(packageSegmentedControll.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        packageDescView.addSubview(packageTitle)
        packageTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
        }
        
        packageDescView.addSubview(packagedescLabel)
        packagedescLabel.snp.makeConstraints { make in
            make.top.equalTo(packageTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
           
        }
       
        packageDescView.addSubview(packagePriceLabel)
        packagePriceLabel.snp.makeConstraints { make in
            make.top.equalTo(packagedescLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
           
        }
        
        packageDescView.addSubview(sendMessageButton)
        sendMessageButton.snp.makeConstraints { make in
            make.top.equalTo(packagePriceLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        
        addSubview(errorMessageLabel)
        errorMessageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    
    func getAdvertDetail(
        detail: (baseImageUrl: String,
                 freelancer: FreelancerOnAdvertDetail)?,
        errorState: Bool){
            if errorState {
                advertBaseImage.isHidden = true
                 advertDetailInfoView.isHidden = true
                 packageIncludeTitleLabel.isHidden = true
                 packageSegmentedControll.isHidden = true
                 packageDescView.isHidden = true
                errorMessageLabel.isHidden = false
                errorMessageLabel.text = TextTheme.errorMessage.text
           
            }else{
                advertBaseImage.isHidden = false
                 advertDetailInfoView.isHidden = false
                 packageIncludeTitleLabel.isHidden = false
                 packageSegmentedControll.isHidden = false
                 packageDescView.isHidden = false
                errorMessageLabel.isHidden = true
                errorMessageLabel.text = TextTheme.errorMessage.text
                
                advertBaseImage.setImageWithKigfisher(with: detail?.baseImageUrl ?? "")
                advertDetailInfoView.configureData(freelancer: detail!.freelancer)
            }
        }
    
    func getAdvertPackage(_ package:Package){
        packageTitle.text = package.title
        packagedescLabel.text = package.detail
        packagePriceLabel.text = "\(package.price) ₺"
    }
}
