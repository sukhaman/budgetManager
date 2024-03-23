//
//  Created by Sukhaman Singh on 3/22/24.
//

import UIKit

class CreditView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Credit"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
       label.text = "$ 2,000"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.init()
        configure()
    }
    
    private func configure() {
        backgroundColor = BudgetManagerColors.secondaryGreen.color
       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowColor = UIColor.clear.cgColor
       layer.shadowOpacity = 2
       layer.shadowOffset = .zero
       layer.shadowRadius = 5
       layoutSubviews()
       layer.cornerRadius = 10
        addSubview(titleLabel)
        addSubview(amountLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            amountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            amountLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    
    }
}
