import Foundation
import UIKit

class MyPageView: UIView {
    var stackView = UIStackView()
    var nameTitleLabel = UILabel()
    var nameLabel = UILabel()
    var emailTitleLabel = UILabel()
    var emailLabel = UILabel()
    var passwordTitleLabael = UILabel()
    var passwordLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(stackView)
        stackView.addArrangedSubview(nameTitleLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailTitleLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(passwordTitleLabael)
        stackView.addArrangedSubview(passwordLabel)

        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center

        nameTitleLabel.text = "name"
        nameTitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        nameTitleLabel.textColor = .systemGray
        nameTitleLabel.textAlignment = .center
        nameTitleLabel.adjustsFontForContentSizeCategory = true

        nameLabel.text = "User Name"
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontForContentSizeCategory = true

        emailTitleLabel.text = "email"
        emailTitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        emailTitleLabel.textColor = .systemGray
        emailTitleLabel.textAlignment = .center
        emailTitleLabel.adjustsFontForContentSizeCategory = true

        emailLabel.text = "User Email"
        emailLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        emailLabel.textAlignment = .center
        emailLabel.adjustsFontForContentSizeCategory = true

        passwordTitleLabael.text = "password"
        passwordTitleLabael.font = UIFont.preferredFont(forTextStyle: .subheadline)
        passwordTitleLabael.textColor = .systemGray
        passwordTitleLabael.textAlignment = .center
        passwordTitleLabael.adjustsFontForContentSizeCategory = true

        passwordLabel.text = "User Password"
        passwordLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        passwordLabel.textAlignment = .center
        passwordLabel.adjustsFontForContentSizeCategory = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTitleLabael.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            nameTitleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            nameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            emailTitleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            emailLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            passwordTitleLabael.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            passwordLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            nameTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            emailTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            passwordTitleLabael.heightAnchor.constraint(equalToConstant: 15),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension MyPageView {
    func configure(with user: User?) {
        if let user = user {
            nameLabel.text = user.name
            emailLabel.text = user.email
            passwordLabel.text = user.password
        } else {
            nameLabel.text = "Default Name"
            emailLabel.text = "Default Email"
            passwordLabel.text = "Default Password"
        }
    }
}
