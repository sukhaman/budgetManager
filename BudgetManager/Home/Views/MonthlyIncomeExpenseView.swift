//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit

class MonthlyIncomeExpenseView: UIView {
    let incomeView: IncomeView = {
        let view = IncomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let expenseView: ExpenseView = {
        let view = ExpenseView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(incomeView)
        addSubview(expenseView)
        // Header view constraints
        NSLayoutConstraint.activate([
        incomeView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        incomeView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        incomeView.widthAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? 150 : 360),
        incomeView.heightAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? 80 : 160),
            
        expenseView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        expenseView.widthAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? 150 : 360),
        expenseView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        expenseView.heightAnchor.constraint(equalToConstant: UITraitCollection.current.horizontalSizeClass == .compact ? 80 : 160)
        ])
    }
}


class IncomeView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Income"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
       label.text = "$ 12,000"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane.arrival")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        addSubview(titleLabel)
        addSubview(amountLabel)
        addSubview(imageAvatar)
        backgroundColor = BudgetManagerColors.secondaryGreen.color
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 2
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layoutSubviews()
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            amountLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10),
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            amountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            imageAvatar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageAvatar.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageAvatar.heightAnchor.constraint(equalToConstant: 20),
            imageAvatar.widthAnchor.constraint(equalToConstant: 20)
            
        ])
    
    }
}


class ExpenseView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Expense"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
       label.text = "$ 9,000"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let imageAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane.departure")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
       
        addSubview(titleLabel)
        addSubview(amountLabel)
        addSubview(imageAvatar)
        backgroundColor = BudgetManagerColors.primaryRed.color
       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowColor = UIColor.clear.cgColor
       layer.shadowOpacity = 2
       layer.shadowOffset = .zero
       layer.shadowRadius = 5
       layoutSubviews()
       layer.cornerRadius = 10
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            amountLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10),
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            amountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            imageAvatar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageAvatar.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageAvatar.heightAnchor.constraint(equalToConstant: 20),
            imageAvatar.widthAnchor.constraint(equalToConstant: 20)
            
        ])
    
    }
}

