//
//  MonthlyBudgetInfoCell.swift
//  BudgetManager
//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit

class MonthlyBudgetInfoCell: UITableViewCell {
    static let reuseID = "MonthlyBudgetInfoCell"
    var labelMonthName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var labelMoneyLeft: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var progressBar: ProgressBarView = {
        let view = ProgressBarView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var labelMoneySpent: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.init()
        configure()
    }
    
    private func configure() {
        backgroundColor = .clear
        contentView.addSubview(progressBar)
        contentView.addSubview(labelMonthName)
        contentView.addSubview(labelMoneyLeft)
        contentView.addSubview(labelMoneySpent)
        
        progressBar.spentAmount = 22 // Example: Amount Spent
        progressBar.budgetAmount = 80 // Example: Budget Amount
        progressBar.totalIncome = 100 // Example: Total Income
        
        NSLayoutConstraint.activate([
            labelMonthName.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            labelMonthName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            labelMonthName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            labelMonthName.heightAnchor.constraint(equalToConstant: 30),
            
            labelMoneyLeft.topAnchor.constraint(equalTo: self.labelMonthName.bottomAnchor, constant: 10),
            labelMoneyLeft.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            labelMoneyLeft.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            labelMoneyLeft.heightAnchor.constraint(equalToConstant: 25),
            
            progressBar.topAnchor.constraint(equalTo: self.labelMoneyLeft.bottomAnchor, constant: 10),
            progressBar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            
            
            labelMoneySpent.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 5),
            labelMoneySpent.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            labelMoneySpent.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            labelMoneySpent.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }
    
    func assignData(_ types: [Budget]) {
        labelMonthName.text = "This month budget"
       
        
        
        var budgetAmount: Double = 0
        var spentAmount: Double = 0
        
        for type in types {
            budgetAmount = budgetAmount + type.estimated
            spentAmount = spentAmount + type.actual
        }
        if budgetAmount - spentAmount > 0 {
            labelMoneyLeft.text = "Great job! You have some money left"
        } else if budgetAmount < spentAmount {
            labelMoneyLeft.text = "Ohhh no! Looks like some things you couldn't control this month"
        }
        labelMoneySpent.text = "$\(spentAmount) of $\(budgetAmount)"
        progressBar.budgetAmount = CGFloat(budgetAmount)
        progressBar.spentAmount = CGFloat(spentAmount)
        
    }
}
