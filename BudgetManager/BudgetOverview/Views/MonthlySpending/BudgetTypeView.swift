//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit

class BudgetTypeView: UIView {
    var labelBudgetName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var labelSpendMoney: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var labelLeftOutMoney: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var buttonEdit: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 12,weight: .regular)
        button.setTitle("Edit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(BudgetManagerColors.primaryGreen.color, for: .normal)
        return button
    }()
    var progressBar: BudgetProgressBarView = {
        let view = BudgetProgressBarView()
        view.backgroundColor = .white
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
    
    func assignData(_ budget: BudgetType) {
        labelBudgetName.text = budget.type
        labelSpendMoney.text = "$\(budget.spentAmount) of $\(budget.limitAmount)"
        
        progressBar.spentAmount = CGFloat(budget.spentAmount)
        progressBar.budgetAmount = CGFloat(budget.limitAmount)
        let moneyLeft = budget.limitAmount - budget.spentAmount
        var status = "Left"
        if moneyLeft < 0 {
            status = "Over"
        }
        labelLeftOutMoney.text = "$\(moneyLeft) \(status)"
    }
    
    private func configure() {
        backgroundColor = .clear
        addSubview(progressBar)
        addSubview(labelBudgetName)
        addSubview(labelLeftOutMoney)
        addSubview(buttonEdit)
        addSubview(labelSpendMoney)
       
        NSLayoutConstraint.activate([
            progressBar.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            progressBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            
            labelBudgetName.bottomAnchor.constraint(equalTo: self.progressBar.topAnchor, constant: -5),
            labelBudgetName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            labelBudgetName.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -5),
            labelBudgetName.heightAnchor.constraint(equalToConstant: 20),
            
            labelLeftOutMoney.bottomAnchor.constraint(equalTo: self.progressBar.topAnchor, constant: -5),
            labelLeftOutMoney.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 5),
            labelLeftOutMoney.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            labelLeftOutMoney.heightAnchor.constraint(equalToConstant: 20),
            
            buttonEdit.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor,constant: 1),
            buttonEdit.centerXAnchor.constraint(equalTo: self.progressBar.centerXAnchor),
            buttonEdit.widthAnchor.constraint(equalToConstant: 60),
            buttonEdit.heightAnchor.constraint(equalToConstant: 20),
            
            labelSpendMoney.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor),
            labelSpendMoney.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            labelSpendMoney.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            labelSpendMoney.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
