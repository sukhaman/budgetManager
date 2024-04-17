//
//  Created by Sukhaman Singh on 3/24/24.
//

protocol BudgetTypeViewCellDelegate: AnyObject {
    func buttonEditTapped(_ index: Int)
}

import UIKit

class BudgetTypeViewCell: UITableViewCell {
    static let reuseID = "BudgetTypeViewCell"
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
    weak var delegate: BudgetTypeViewCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.init()
        configure()
    }
    
    
    func assignData(_ budget: Budget) {
        labelBudgetName.text = budget.category
        labelSpendMoney.text = "$\(budget.actual) of $\(budget.estimated)"
        
        progressBar.spentAmount = CGFloat(budget.actual)
        progressBar.budgetAmount = CGFloat(budget.estimated)
        let moneyLeft = budget.estimated - budget.actual
        var status = "Left"
        if moneyLeft < 0 {
            status = "Over"
        }
        labelLeftOutMoney.text = "$\(moneyLeft) \(status)"
    }
    
    private func configure() {
        backgroundColor = .clear
            contentView.addSubview(progressBar)
        contentView.addSubview(labelBudgetName)
        contentView.addSubview(labelLeftOutMoney)
        contentView.addSubview(buttonEdit)
        contentView.addSubview(labelSpendMoney)
       
        NSLayoutConstraint.activate([
            progressBar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            
            labelBudgetName.bottomAnchor.constraint(equalTo: self.progressBar.topAnchor, constant: -5),
            labelBudgetName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelBudgetName.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            labelBudgetName.heightAnchor.constraint(equalToConstant: 20),
            
            labelLeftOutMoney.bottomAnchor.constraint(equalTo: self.progressBar.topAnchor, constant: -5),
            labelLeftOutMoney.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            labelLeftOutMoney.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelLeftOutMoney.heightAnchor.constraint(equalToConstant: 20),
            
            buttonEdit.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor,constant: 1),
            buttonEdit.centerXAnchor.constraint(equalTo: self.progressBar.centerXAnchor),
            buttonEdit.widthAnchor.constraint(equalToConstant: 60),
            buttonEdit.heightAnchor.constraint(equalToConstant: 20),
            
            labelSpendMoney.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor),
            labelSpendMoney.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelSpendMoney.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelSpendMoney.heightAnchor.constraint(equalToConstant: 20)
        ])
        buttonEdit.addTarget(self, action: #selector(buttonEditTapped(_:)), for: .touchUpInside)
    }
    
    @objc func buttonEditTapped(_ sender: UIButton) {
        self.delegate?.buttonEditTapped(sender.tag)
    }
}
