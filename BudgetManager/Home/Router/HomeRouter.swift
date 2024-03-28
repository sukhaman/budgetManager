//
//  Created by Sukhaman Singh on 3/27/24.
//

import UIKit

protocol HomeRouterProtocol {
    func showAddAccount(_ item: HomeItem)
}

enum HomeItem {
    case present
    
}

class HomeRouter: HomeRouterProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showAddAccount(_ item: HomeItem) {
        switch item {
        case .present:
            let destVC = AddAccountVC()
            destVC.modalTransitionStyle = .coverVertical
            destVC.modalPresentationStyle = .formSheet
            navigationController?.present(destVC, animated: false)
        }
    }
}

class AddAccountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
    }
}

