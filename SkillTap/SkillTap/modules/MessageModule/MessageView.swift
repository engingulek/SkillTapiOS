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
    var presenter : ViewToPrensenterMessageProtocol?
    private let messageTextField = UITextField()
    private var textFieldBottomConstraint: Constraint?
    private var arrowButtonConstraint : Constraint?
    private lazy var messageCollectionView : UICollectionView =
    UICollectionView.primaryCollectionView(scroolDirection: .vertical)
    private lazy var arrowSendMessageButton : UIButton = UIButton.arrowMessageButton(action: sendMessageAction)
    private lazy var messageText : String = ""
    
    private lazy var sendMessageAction  : UIAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        if !messageText.isEmpty{
            presenter?.sendMessageAction(message: messageText)
            messageTextField.text = ""
           

        }
    }
    
    override func setupView() {
        super.setupView()
        configureView()
        setupKeyboardObservers()
        setupTapGestureToDismissKeyboard()
        messageCollectionView.register(MessageCVC.self, forCellWithReuseIdentifier: MessageCVC.identifier)
        
        
        messageTextField.addTarget(self, 
                                   action: #selector(messageTextFieldEditChanged), for: .editingChanged)
        
        
        
      
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    @objc private func messageTextFieldEditChanged(_ textField: UITextField){
        guard let text = textField.text else {return}
        messageText = text
       
       
    }
    
    
    func messageCollectionViewPrepare() {
        messageCollectionView.delegate = controller
        messageCollectionView.dataSource = controller
    }
    
    func messageCollectionViewRealoaData(){
        messageCollectionView.reloadData()
    }
    

    
    
    private func configureView() {
        
        messageTextField.placeholder = "Messsage"
        messageTextField.borderStyle = .roundedRect
      
        
        addSubview(arrowSendMessageButton)
        arrowSendMessageButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.size.equalTo(50)
            arrowButtonConstraint = make.bottom.equalToSuperview().inset(20).constraint
        }
        
        addSubview(messageTextField)
        messageTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(arrowSendMessageButton.snp.leading).offset(-5)
            make.height.equalTo(50)
            
            textFieldBottomConstraint = make.bottom.equalToSuperview().inset(20).constraint
        }
        
        addSubview(messageCollectionView)
        messageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(messageTextField.snp.top)
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
        
        
        textFieldBottomConstraint?.update(inset: keyboardHeight + 20)
        arrowButtonConstraint?.update(inset: keyboardHeight + 20)
        
        
        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
        }
    }
    
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        textFieldBottomConstraint?.update(inset: 20)
        arrowButtonConstraint?.update(inset: 20)
        
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
