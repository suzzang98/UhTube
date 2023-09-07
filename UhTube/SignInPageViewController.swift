//
//  SignInPageViewController.swift
//  UhTube
//
//  Created by 이수현 on 2023/09/04.
//

import UIKit
import SwiftUI

class SignInPageViewController: UIViewController {
    
    let signInPageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    // 네비게이션 바 생성
    let signInPageNavigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.isTranslucent = false
        return navigationBar
    }()
    
    let naviItem: UINavigationItem = {
        let navigationItem = UINavigationItem(title: "Sign In")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: nil, action: nil)
        return navigationItem
    }()
    
    let largeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create your Account!"
        label.font = label.font.withSize(32)
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "기본 정보를 입력하세요."
        label.font = label.font.withSize(16)
        return label
    }()
    
    let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        
        return stackView
    } ()
    
    // 아래쪽
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = label.font.withSize(20)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = label.font.withSize(20)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = label.font.withSize(20)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        
        return stackView
    }()
    
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setKeyboardObserver()
        addConfigue()
        
    }
    func addConfigue() {
        configureSignInPageNavigationBar()
        //        configureScrollView()
        configureLabelsStackView()
        configureTextFieldsStackView()
        configureCreateButton()
    }
    
    func configureSignInPageNavigationBar() {
        signInPageNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(signInPageNavigationBar)
        
        signInPageNavigationBar.setItems([naviItem], animated: true)
        
        NSLayoutConstraint.activate([
            signInPageNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signInPageNavigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            signInPageNavigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    //    func configureScrollView() {
    //        signInPageScrollView.addSubview(labelsStackView)
    //        signInPageScrollView.addSubview(textFieldsStackView)
    //        signInPageScrollView.addSubview(createButton)
    //
    //        signInPageScrollView.translatesAutoresizingMaskIntoConstraints = false
    //
    //        NSLayoutConstraint.activate([
    //            signInPageScrollView.topAnchor.constraint(equalTo: signInPageNavigationBar.bottomAnchor),
    //            signInPageScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
    //            signInPageScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    //            signInPageScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    //        ])
    //
    //
    //    }
    func configureLabelsStackView() {
        labelsStackView.addArrangedSubview(largeTitleLabel)
        labelsStackView.addArrangedSubview(detailLabel)
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: signInPageNavigationBar.bottomAnchor, constant: 50),
            labelsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
    }
    
    func configureTextField() {
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 64),
            emailTextField.heightAnchor.constraint(equalToConstant: 64),
            passwordTextField.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    func configureTextFieldsStackView() {
        configureTextField()
        textFieldsStackView.addArrangedSubview(nameLabel)
        textFieldsStackView.addArrangedSubview(nameTextField)
        textFieldsStackView.addArrangedSubview(emailLabel)
        textFieldsStackView.addArrangedSubview(emailTextField)
        textFieldsStackView.addArrangedSubview(passwordLabel)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldsStackView)
        
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 50),
            textFieldsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    
    func configureCreateButton() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createButton)
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 50),
            createButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            createButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            createButton.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        createButton.addTarget(self, action: #selector(createButtonPressed) , for: .touchUpInside)
    }
    
    @objc func createButtonPressed() {
        if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" {
            let notification = UIAlertController(title: "빈 항목이 존재합니다.", message: nil, preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "돌아가기", style: UIAlertAction.Style.default, handler: nil)
            
            notification.addAction(onAction)
            present(notification, animated: true, completion: nil)
        } else {
            let user = User(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
            UserManager.shared.saveUser(user)
            //화면 전환 코드 추가
        }
    }
    
}
//extension UIViewController {
//
//    func setKeyboardObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
//    }
//
//    @objc func keyboardWillShow(notification: NSNotification) {
//          if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                  let keyboardRectangle = keyboardFrame.cgRectValue
//                  let keyboardHeight = keyboardRectangle.height
//              UIView.animate(withDuration: 1) {
//                  self.view.window?.frame.origin.y -= keyboardHeight
//              }
//          }
//      }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.window?.frame.origin.y != 0 {
//            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                    let keyboardRectangle = keyboardFrame.cgRectValue
//                    let keyboardHeight = keyboardRectangle.height
//                UIView.animate(withDuration: 1) {
//                    self.view.window?.frame.origin.y += keyboardHeight
//                }
//            }
//        }
//    }
//}

#if DEBUG
struct ViewControllerRepresentable: UIViewControllerRepresentable{
    //  update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
    //  makeui
}
struct ViewController_Previews: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
            .previewDisplayName("아이폰 14")
    }
}
#endif
