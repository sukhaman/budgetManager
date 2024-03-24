//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit

class SpendingOverviewVC: UIViewController {
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
    var budgetTypeView: BudgetTypeView = {
        let view = BudgetTypeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        assignBudgetData()
    }
    
    private func configureViewController() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        view.addSubview(progressBar)
        view.addSubview(labelMonthName)
        view.addSubview(labelMoneyLeft)
        view.addSubview(labelMoneySpent)
        progressBar.spentAmount = 22 // Example: Amount Spent
        progressBar.budgetAmount = 80 // Example: Budget Amount
        progressBar.totalIncome = 100 // Example: Total Income
        
        view.addSubview(budgetTypeView)
        NSLayoutConstraint.activate([
            
            labelMonthName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            labelMonthName.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelMonthName.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelMonthName.heightAnchor.constraint(equalToConstant: 30),
            
            labelMoneyLeft.topAnchor.constraint(equalTo: self.labelMonthName.bottomAnchor, constant: 10),
            labelMoneyLeft.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelMoneyLeft.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelMoneyLeft.heightAnchor.constraint(equalToConstant: 25),
            
            progressBar.topAnchor.constraint(equalTo: self.labelMoneyLeft.bottomAnchor, constant: 10),
            progressBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            
            
            labelMoneySpent.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 5),
            labelMoneySpent.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelMoneySpent.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelMoneySpent.heightAnchor.constraint(equalToConstant: 20),
            
            budgetTypeView.topAnchor.constraint(equalTo: self.labelMoneySpent.topAnchor, constant: 30),
            budgetTypeView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            budgetTypeView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            budgetTypeView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func assignBudgetData() {
        let autoInsuranceBudget = BudgetType(id: 2, type: "Auto Insurance", limitAmount: 230, spentAmount: 140, color: .red)
        budgetTypeView.assignData(autoInsuranceBudget)
        labelMonthName.text = "This month budget"
        labelMoneyLeft.text = "Great job! You have some money left"
        labelMoneySpent.text = "$1,234 of $12,345"
    }
}
