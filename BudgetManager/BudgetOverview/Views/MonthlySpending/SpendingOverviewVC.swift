//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit

class SpendingOverviewVC: UIViewController {
    var progressBar: ProgressBarView = {
        let view = ProgressBarView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        view.addSubview(progressBar)
        progressBar.spentAmount = 22 // Example: Amount Spent
        progressBar.budgetAmount = 80 // Example: Budget Amount
        progressBar.totalIncome = 100 // Example: Total Income
        
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            progressBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
