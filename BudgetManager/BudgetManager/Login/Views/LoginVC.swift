//
//  Created by Sukhaman Singh on 3/17/24.
//

import UIKit

class LoginVC: UIViewController {
    
    let loginView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        let attributedPlaceholder = NSAttributedString(string: "\(LoginPresenter.email)", attributes: attributes)

        // Assign the attributed placeholder text to the text field
        textField.attributedPlaceholder = attributedPlaceholder
        textField.backgroundColor = UIColor(resource: .textFieldBG)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        let attributedPlaceholder = NSAttributedString(string: "\(LoginPresenter.password)", attributes: attributes)

        // Assign the attributed placeholder text to the text field
        textField.attributedPlaceholder = attributedPlaceholder
        textField.backgroundColor = UIColor(resource: .textFieldBG)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("\(LoginPresenter.forgotPassword)?", for: .normal)
        var buttonConfig = UIButton.Configuration.borderless()
         // Adjust contentInsets to provide padding
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // Apply configuration to the button
        button.configuration = buttonConfig
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("\(LoginPresenter.signin)", for: .normal)
        button.backgroundColor = UIColor(resource: .secondaryGreen)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 22.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        var buttonConfig = UIButton.Configuration.borderless()
         // Adjust contentInsets to provide padding
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // Apply configuration to the button
        button.configuration = buttonConfig
        button.setTitle("\(LoginPresenter.signup)", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = UIColor(resource: .primaryGreen)
        view.addSubview(loginView)
        loginView.addSubview(emailTextField)
        loginView.addSubview(passwordTextField)
        loginView.addSubview(forgotPasswordButton)
        loginView.addSubview(signInButton)
        loginView.addSubview(signupButton)
        let screenWidth = view.frame.width
        
        
        NSLayoutConstraint.activate([
            // Login View
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.widthAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? (screenWidth * 0.9) : 440),
            loginView.heightAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? (screenWidth * 0.9) : 440),
            
            // Email Text Field
            emailTextField.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password Text Field
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Forgot Password Button
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 150),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30),
            
            // Sign In Button
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            signupButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signupButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            signupButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            signupButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
