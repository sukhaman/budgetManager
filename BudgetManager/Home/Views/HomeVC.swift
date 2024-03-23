//
//  Created by Sukhaman Singh on 3/18/24.
//

import UIKit

class HomeVC: UIViewController {
    
    public private (set) var profile: User?
    let headerView: HomeHeaderView = {
        let view = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cashView: CashView = {
        let view = CashView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let creditView: CreditView = {
        let view = CreditView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let investmentView: InvestmentView = {
        let view = InvestmentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        configureViewController()
    }
    
    convenience init(profile: User? = nil) {
        self.init()
        self.profile = profile
        headerView.assignData(profile)
    }
    
    private func configureViewController() {
       self.view.addSubview(headerView)
        view.addSubview(cashView)
        view.addSubview(creditView)
        view.addSubview(investmentView)
        
        NSLayoutConstraint.activate([
        // Header view constraints
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            cashView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 20),
            cashView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            cashView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            cashView.heightAnchor.constraint(equalToConstant: 50),
            
            creditView.topAnchor.constraint(equalTo: self.cashView.bottomAnchor, constant: 20),
            creditView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            creditView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            creditView.heightAnchor.constraint(equalToConstant: 50),
            
            investmentView.topAnchor.constraint(equalTo: self.creditView.bottomAnchor, constant: 20),
            investmentView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            investmentView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            investmentView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
