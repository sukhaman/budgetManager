//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit

class SpendingOverviewVC: UIViewController {
    
    var budgetTypeTableView: UITableView = {
       let tableView = UITableView()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    var budgetTypes: [BudgetType] = []
    var router: BudgetRouter?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        assignBudgetData()
        if let navigationController {
            self.router = BudgetRouter(navigationController: navigationController)
        }
    }
    
    private func configureViewController() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        
       
        self.budgetTypeTableView.register(BudgetTypeViewCell.self, forCellReuseIdentifier: BudgetTypeViewCell.reuseID)
        self.budgetTypeTableView.register(MonthlyBudgetInfoCell.self, forCellReuseIdentifier: MonthlyBudgetInfoCell.reuseID)
        view.addSubview(budgetTypeTableView)
        budgetTypeTableView.delegate = self
        budgetTypeTableView.dataSource = self
        NSLayoutConstraint.activate([
            budgetTypeTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            budgetTypeTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            budgetTypeTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            budgetTypeTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func assignBudgetData() {
        let budgetTypes =  [
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
        
        self.budgetTypes = budgetTypes
        self.budgetTypeTableView.reloadData()
        
       // budgetTypeView.assignData(autoInsuranceBudget)
       
    }
    
}

extension SpendingOverviewVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
      
        return self.budgetTypes.count + 1
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MonthlyBudgetInfoCell.reuseID, for: indexPath) as! MonthlyBudgetInfoCell
            cell.assignData(budgetTypes)
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: BudgetTypeViewCell.reuseID, for: indexPath) as! BudgetTypeViewCell
            
            let budget = budgetTypes[indexPath.section - 1]
            cell.delegate = self
            cell.buttonEdit.tag = indexPath.section - 1
            cell.assignData(budget)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
         return 90
        } else {
            return 55
        }
    }
    
}

extension SpendingOverviewVC: BudgetTypeViewCellDelegate {
    func buttonEditTapped(_ index: Int) {
        let budgetType = budgetTypes[index]
        self.router?.show(.budgetEdit(budgetType))
    }
}
