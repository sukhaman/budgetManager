//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit

protocol BudgetRouterProtocol {
    func show(_ item: BudgetItem)
    func back()
}

enum BudgetItem {
    case budgetEdit(_ type: Budget)
    
}

class BudgetRouter: BudgetRouterProtocol {
    weak var navigationController: UINavigationController?
   
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func show(_ item: BudgetItem) {
        switch item {
        case .budgetEdit(let type):
            let destVC = CreateBudgetTypeVC()
            destVC.budgetType = type
            navigationController?.pushViewController(destVC, animated: true)
        }
    }
    func back() {
        navigationController?.popViewController(animated: true)
    }
}
