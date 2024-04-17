//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit
import CoreData


class MonthlySpendingVC: UIViewController {
    private let circleView: CircleView = {
       let view = CircleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    private let collectionView: BudgetTypeCollectionView = {
       let view = BudgetTypeCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        assignBudgetData()
    }
    private var budgetList = [Budget]()
    
    private func configureViewController() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        view.addSubview(circleView)
        view.addSubview(collectionView)
         
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            circleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            circleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            circleView.heightAnchor.constraint(equalToConstant: 200),
            
            collectionView.topAnchor.constraint(equalTo: circleView.bottomAnchor,constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
   private func assignBudgetData() {
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       let fetchRequest: NSFetchRequest<Budget> = Budget.fetchRequest()
       
       do {
           // Execute the fetch request to get an array of Transaction objects
           let budgets = try context.fetch(fetchRequest)
           var totalBudgetAmount: Double = 0
           var totalSpentAmount: Double = 0
           self.budgetList = budgets
           circleView.budgetTypes = budgetList
           collectionView.assignData(budgetList)
           for budget in budgets {
               totalBudgetAmount += budget.estimated
               totalSpentAmount += budget.actual
           }
           print("Budget limit is set for \(totalBudgetAmount) and already spent money \(totalSpentAmount)")
          try  context.save()
       } catch {
           
       }
       
       // budgetTypeView.assignData(autoInsuranceBudget)
       
    }
}
