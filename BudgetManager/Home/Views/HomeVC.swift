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
        
        NSLayoutConstraint.activate([
        // Header view constraints
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
}
