//
//  Created by Sukhaman Singh on 3/21/24.
//

import UIKit

protocol TabBarRouterProtocol {
    func showTab(_ tab: TabBarItem)
}

enum TabBarItem {
    case home
    case monthly
    case settings
    
}

class TabBarRouter: TabBarRouterProtocol {
    weak var tabBarController: UITabBarController?
    var user: User?
    
    init(tabBarController: UITabBarController, user: User?) {
        self.tabBarController = tabBarController
        self.user = user
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        setTabBarAppearance()
        // MARK: Home Controller
        let homeViewController = HomeVC(profile: user)
        let homeNavigation = UINavigationController(rootViewController: homeViewController)
        homeNavigation.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "list.bullet.clipboard"), tag: 0)
        
        // MARK: BUdget Controller
        let budgetController = MonthlySpendingVC()
        let budgetNavigation = UINavigationController(rootViewController: budgetController)
        budgetController.tabBarItem = UITabBarItem(title: "Report", image: UIImage(systemName: "banknote"), tag: 1)
        
        // MARK: Settings Controller
        let settingViewController = SettingsVC()
        let settingsNavigation = UINavigationController(rootViewController: settingViewController)
        settingViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"),tag: 2)
        
        tabBarController?.viewControllers = [homeNavigation,budgetNavigation,settingsNavigation]
        
    }
    
    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = BudgetManagerColors.secondaryGreen.color
        
        appearance.compactInlineLayoutAppearance.normal.iconColor = .lightText
        appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.lightText]
        
        appearance.inlineLayoutAppearance.normal.iconColor = .lightText
        appearance.inlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.lightText]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .lightText
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.lightText]
        
        self.tabBarController?.tabBar.standardAppearance = appearance
        self.tabBarController?.tabBar.scrollEdgeAppearance = self.tabBarController?.tabBar.standardAppearance
        self.tabBarController?.tabBar.tintColor = .white
        self.tabBarController?.tabBar.layer.cornerRadius = 20
        self.tabBarController?.tabBar.layer.masksToBounds = true
    }
    
    func showTab(_ tab: TabBarItem) {
        guard let index = tabBarController?.viewControllers?.firstIndex(where: { viewController in
            switch tab {
            case .home:
                return viewController is HomeVC
            case .monthly:
                return viewController is BudgetSpendingOverviewVC
            case .settings:
                return viewController is SettingsVC
            }
        }) else {
            return
        }
        
        tabBarController?.selectedIndex = index
    }
}

