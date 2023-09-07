//
//  LoginPageViewController.swift
//  UhTube
//
//  Created by 이수현 on 2023/09/04.
//

import UIKit

class LoginPageViewController: UIViewController {

    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "UhTube"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    let idTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.borderStyle = .roundedRect
        tf.textColor = .black
        return tf
    }()
    
    let pwTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = .roundedRect
        tf.textColor = .black
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.backgroundColor = .red
        button.layer.cornerRadius = 50 / 2
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
        
        
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 50 / 2
        button.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
        return button
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    @objc func loginButtonDidTap() {
        if idTextField.text == UserManager.shared.getUser()?.email && pwTextField.text == UserManager.shared.getUser()?.password {
            let myTabVC = UIStoryboard.init(name: "Main", bundle: nil)
            guard let nextVC = myTabVC.instantiateViewController(withIdentifier: "Main")as? UITabBarController else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
            
            
        }
        else {
            let alert = UIAlertController(title: "아이디와 패스워드를 확인하세요", message: nil , preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "돌아가기", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(onAction)
            present(alert, animated: true, completion: nil)
        }

    }
    
    @objc func signUpButtonDidTap() {
       print("DEBUG: button tapped!")
        let signInPage = UIStoryboard.init(name: "SignInPage", bundle: nil)
        guard let signInPageViewController = signInPage.instantiateViewController(withIdentifier: "SignInPage")as? SignInPageViewController else {return}

        signInPageViewController.modalPresentationStyle = .fullScreen
        self.show(signInPageViewController, sender: nil)
    }

    func configureUI() {
        
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [idTextField, pwTextField, loginButton, signupButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        view.addSubview(titleLable)
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 40),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            
            
        ])
        
    }
   
}
