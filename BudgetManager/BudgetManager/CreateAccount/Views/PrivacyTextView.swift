//
//  Created by Sukhaman Singh on 3/17/24.
//

import UIKit

class PrivacyTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        let privacyText = CreateAccountPresenter.privacyPolicy
        let termsText = CreateAccountPresenter.termsCondition
        let attributedString = NSMutableAttributedString()

        // Define attributes for the main text (white color)
        let mainAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        let mainAttributedString = NSAttributedString(string: "\(CreateAccountPresenter.agree) ", attributes: mainAttributes)
        attributedString.append(mainAttributedString)

        // Define attributes for the Privacy Policy text (different color)
        let privacyAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(resource: .secondaryGreen),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        let privacyAttributedString = NSAttributedString(string: privacyText, attributes: privacyAttributes)
        attributedString.append(privacyAttributedString)

        // Append " and " with main attributes
        let andAttributedString = NSAttributedString(string: " \(CreateAccountPresenter.and) ", attributes: mainAttributes)
        attributedString.append(andAttributedString)

        // Define attributes for the Terms of Service text (different color)
        let termsAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(resource: .secondaryGreen),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        let termsAttributedString = NSAttributedString(string: termsText, attributes: termsAttributes)
        attributedString.append(termsAttributedString)

        attributedText = attributedString
        isEditable = false
        isSelectable = true
        textAlignment = .center
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
