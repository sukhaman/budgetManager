//
//  Created by Sukhaman Singh on 3/22/24.
//

import UIKit

protocol HomeHeaderViewDelegate: AnyObject {
    func buttonAddTapped()
}

class HomeHeaderView: UIView {
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back,"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let alertButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    weak var delegate: HomeHeaderViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.init()
        configure()
    }
    
    func assignData(_ user: User?) {
        nameLabel.text = user?.username
    }
    
    
    func configure() {
        addSubview(greetingLabel)
        addSubview(nameLabel)
        addSubview(alertButton)
        addSubview(addButton)
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: self.topAnchor),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            greetingLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            alertButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            alertButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            alertButton.heightAnchor.constraint(equalToConstant: 20),
            alertButton.widthAnchor.constraint(equalToConstant: 20),
            
            addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: self.alertButton.leadingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 20),
            addButton.widthAnchor.constraint(equalToConstant: 20)
           
        ])
        
        addButton.addAction {
            self.delegate?.buttonAddTapped()
        }
        
    }
    
}
