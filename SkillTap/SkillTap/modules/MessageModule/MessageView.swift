//
//  MessageView.swift
//  SkillTap
//
//  Created by Engin Gülek on 9.12.2024.
//

import Foundation
import UIKit
import SnapKit
class MessageView : BaseView<MesssageViewController> {
    private let textField = UITextField()
    private var textFieldBottomConstraint: Constraint?
    private lazy var messageCollectionView : UICollectionView = 
    UICollectionView.primaryCollectionView(scroolDirection: .vertical)
    override func setupView() {
        super.setupView()
        configureView()
        setupKeyboardObservers()
        setupTapGestureToDismissKeyboard()
        messageCollectionView.register(MessageCVC.self, forCellWithReuseIdentifier: MessageCVC.identifier)
        
      
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
    func messageCollectionViewPrepare() {
        messageCollectionView.delegate = controller
        messageCollectionView.dataSource = controller
    }
    
    func messageCollectionViewRealoaData(){
        messageCollectionView.reloadData()
    }
    
    
    private func configureView() {
        
        textField.placeholder = "Messsage"
        textField.borderStyle = .roundedRect
        addSubview(textField)
        
        
        textField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
            textFieldBottomConstraint = make.bottom.equalToSuperview().inset(16).constraint
        }
        
        addSubview(messageCollectionView)
        messageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(textField.snp.top)
        }
    }
    
    private func setupKeyboardObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        let keyboardHeight = keyboardFrame.height
        
        
        textFieldBottomConstraint?.update(inset: keyboardHeight + 16)
        
        
        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
        }
    }
    
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        textFieldBottomConstraint?.update(inset: 16)
        
        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
        }
    }
    
    private func setupTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)
    }
    
}
