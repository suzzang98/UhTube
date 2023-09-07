import UIKit

class MyPageViewController: UIViewController {
    var logoutButton = UIButton()
    var UhTubeLabel = UILabel()
    var welcomeLabel = UILabel()
    var mypageView = MyPageView()
  
    var deleteButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    
        if let user = UserManager.shared.getUser() {
            mypageView.configure(with: user)
        }
    }
}
    
extension MyPageViewController {
    private func setup() {
        view.addSubview(logoutButton)
        view.addSubview(UhTubeLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(mypageView)
        view.addSubview(deleteButton)
        
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.backgroundColor = .systemBackground
        logoutButton.setTitleColor(.label, for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        
        UhTubeLabel.text = "UhTube"
        UhTubeLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        UhTubeLabel.textAlignment = .center
        UhTubeLabel.adjustsFontForContentSizeCategory = true
        
        welcomeLabel.text = "Welcome!"
        welcomeLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        welcomeLabel.textColor = UIColor.systemGray2
        welcomeLabel.textAlignment = .center
        welcomeLabel.adjustsFontForContentSizeCategory = true
        
        mypageView.backgroundColor = .systemBackground
        
        deleteButton.setTitle("계정 삭제", for: .normal)
        deleteButton.backgroundColor = .systemGray5
        deleteButton.setTitleColor(.systemRed, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        UhTubeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        mypageView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -1),
            logoutButton.widthAnchor.constraint(equalToConstant: 75),
            logoutButton.heightAnchor.constraint(equalToConstant: 35),
            
            UhTubeLabel.bottomAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: -1),
            UhTubeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            UhTubeLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -1),
            UhTubeLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            UhTubeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            welcomeLabel.bottomAnchor.constraint(equalTo: mypageView.topAnchor, constant: -40),
            welcomeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            welcomeLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -1),
            welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            mypageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mypageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mypageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mypageView.heightAnchor.constraint(equalToConstant: 170),
            
            deleteButton.topAnchor.constraint(equalTo: mypageView.bottomAnchor, constant: 60),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 75),
            deleteButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
}

// LoginPageViewController연결된 identity: 스토리보드id 수정 필요!!
extension MyPageViewController {
    @objc func logoutTapped(sender: UIButton) {
        let loginPage = UIStoryboard(name: "LoginPage", bundle: nil)
        guard let loginPageController = loginPage.instantiateViewController(withIdentifier: "LoginPage") as? LoginPageViewController else { return }

        loginPageController.modalPresentationStyle = .fullScreen
        present(loginPageController, animated: true, completion: nil)
    }
        
    @objc func deleteButtonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "계정 삭제", message: "삭제된 계정은 복구할 수 없습니다!", preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "Confirm", style: .default) { _ in
            
            let loginPage = UIStoryboard(name: "LoginPage", bundle: nil)
            guard let loginPageController = loginPage.instantiateViewController(withIdentifier: "LoginPage") as? LoginPageViewController else { return }
            
            loginPageController.modalPresentationStyle = .fullScreen
            self.present(loginPageController, animated: true, completion: nil)
        }

        UserManager.shared.deleteUser()
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(confirmButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
}
