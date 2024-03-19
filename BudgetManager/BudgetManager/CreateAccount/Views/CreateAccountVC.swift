//
//  Created by Sukhaman Singh on 3/17/24.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    let signupView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = CreateAccountPresenter.signup
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        let attributedPlaceholder = NSAttributedString(string: CreateAccountPresenter.name, attributes: attributes)

        // Assign the attributed placeholder text to the text field
        textField.attributedPlaceholder = attributedPlaceholder
        textField.backgroundColor = UIColor(resource: .textFieldBG)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        let attributedPlaceholder = NSAttributedString(string: CreateAccountPresenter.email, attributes: attributes)

        // Assign the attributed placeholder text to the text field
        textField.attributedPlaceholder = attributedPlaceholder
        textField.backgroundColor = UIColor(resource: .textFieldBG)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: PasswordTextField = {
        let textField = PasswordTextField()
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        let attributedPlaceholder = NSAttributedString(string: CreateAccountPresenter.password, attributes: attributes)

        // Assign the attributed placeholder text to the text field
        textField.attributedPlaceholder = attributedPlaceholder
        textField.backgroundColor = UIColor(resource: .textFieldBG)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let privacyTextView = PrivacyTextView()
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(CreateAccountPresenter.signup, for: .normal)
        button.backgroundColor = UIColor(resource: .secondaryGreen)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 22.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
     configureViewController()
    }
    
    // Set up UI
    func configureViewController() {
        view.backgroundColor  = UIColor(resource: .primaryGreen)
        view.addSubview(signupView)
        signupView.addSubview(titleLabel)
        signupView.addSubview(nameTextField)
        signupView.addSubview(emailTextField)
        signupView.addSubview(passwordTextField)
        signupView.addSubview(signupButton)
        signupView.addSubview(privacyTextView)
        let screenWidth = view.frame.width
        
        
        NSLayoutConstraint.activate([
            // Login View
            signupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            signupView.widthAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? (screenWidth * 0.9) : 440),
            signupView.heightAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? (screenWidth * 0.9) : 440),
           
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: signupView.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: signupView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: signupView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
           
            // Name Text Field
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: signupView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: signupView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Email Text Field
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: signupView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: signupView.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password Text Field
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: signupView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: signupView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            // Sign Up Button
            signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signupButton.leadingAnchor.constraint(equalTo: signupView.leadingAnchor, constant: 20),
            signupButton.trailingAnchor.constraint(equalTo: signupView.trailingAnchor, constant: -20),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Privacy TextView
            privacyTextView.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 20),
            privacyTextView.leadingAnchor.constraint(equalTo: signupView.leadingAnchor, constant: 20),
            privacyTextView.trailingAnchor.constraint(equalTo: signupView.trailingAnchor, constant: -20),
            privacyTextView.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        assignActions()
    
    }
    
    private func assignActions() {
        signupButton.addAction { [weak self] in
            self?.createAccountRequest()
        }
    }
    
    private func createAccountRequest() {
        do {
            let name  = try CreateAccountValidationService().validateUsername(self.nameTextField.text)
            
        } catch {
            self.showAlert(error.localizedDescription)
        }
    }
    
    private func showAlert(_ message: String) {
        let alertController = UIAlertController (title: nil, message:message, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "OK", style:  .default , handler: { (actionSheetController) -> Void in
            
        })
        alertController.addAction(OkAction)
        navigationController?.present(alertController, animated: true , completion: nil)
    }
}
