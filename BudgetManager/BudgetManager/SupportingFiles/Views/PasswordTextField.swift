//
//  Created by Sukhaman Singh on 3/17/24.
//

import UIKit

class PasswordTextField: UITextField {

    // Icon image for password visibility toggle
    let eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()

    // Flag to track password visibility
    var isPasswordVisible = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupEyeButton()
    }

    private func setupEyeButton() {
        // Set the rightView to the eye button
        rightView = eyeButton
        rightViewMode = .always
        
        // Set secure text entry by default
        isSecureTextEntry = true
        eyeButton.addAction {
            self.togglePasswordVisibility()
        }
    }

    @objc private func togglePasswordVisibility() {
        isSecureTextEntry = !isSecureTextEntry
        isPasswordVisible.toggle()

        // Update eye button icon based on password visibility
        let eyeIcon = isPasswordVisible ? "eye.slash" : "eye"
        eyeButton.setImage(UIImage(systemName: eyeIcon), for: .normal)
    }
}
