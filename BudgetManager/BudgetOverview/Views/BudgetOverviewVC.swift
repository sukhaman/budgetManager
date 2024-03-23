//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit

struct BudgetType: Equatable {
    var id: Int
    var type: String
    var limitAmount: Double
    var spentAmount: Double
    var color: UIColor
    
}


class BudgetOverviewVC: UIViewController {
    private let circleView: CircleView = {
       let view = CircleView()
        view.budgetLimit = [
            BudgetType(id: 1, type: "Mortgage & Rent", limitAmount: 2300, spentAmount: 2300, color: BudgetManagerColors.primaryRed.color),
            BudgetType(id: 2, type: "Auto Insurance", limitAmount: 220, spentAmount: 20, color: .brown),
            BudgetType(id: 3, type: "Tolls", limitAmount: 80, spentAmount: 30, color: .yellow),
            BudgetType(id: 4, type: "Mobile Bills", limitAmount: 200, spentAmount: 200, color: .cyan),
            BudgetType(id: 5, type: "Babysitter & Daycare", limitAmount: 1500, spentAmount: 1500, color: .blue),
            BudgetType(id: 6, type: "Groceries", limitAmount: 1200, spentAmount: 1000, color: .darkGray),
            BudgetType(id: 7, type: "Restrauant", limitAmount: 300, spentAmount: 300, color: .lightGray),
            BudgetType(id: 8, type: "Gas & Fuel", limitAmount: 500, spentAmount: 500, color: .purple),
            BudgetType(id: 9, type: "Shopping", limitAmount: 200, spentAmount: 200, color: .magenta),
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        view.addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            circleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            circleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            circleView.heightAnchor.constraint(equalToConstant: 200)
        ])

    }
}
