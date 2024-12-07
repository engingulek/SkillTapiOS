//
//  FreelancerDetailViewController.swift
//  SkillTap
//
//  Created by Engin Gülek on 7.12.2024.
//

import UIKit

class FreelancerDetailViewController: ViewController {
    lazy var presenter : ViewToPrensenterFreelancerProtocol = FreelancerPresenter(view:self)
    private lazy var freelancerView = FreelancerView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        //TODO: move to presenter
        freelancerView.configureFreelancerInfoData()
    }
    
    override func loadView() {
        view = freelancerView
    }
    
    
}

//MARK: PresenterToViewFreelancerProtocol
extension FreelancerDetailViewController : PresenterToViewFreelancerProtocol {
    
}
