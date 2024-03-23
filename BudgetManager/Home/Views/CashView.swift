//
//  Created by Sukhaman Singh on 3/22/24.
//

import UIKit

class CashView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cash"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
       label.text = "$ 12,000"
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
        addSubview(nameLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    
    }
}
