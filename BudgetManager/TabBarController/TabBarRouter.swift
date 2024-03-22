//
//  Created by Sukhaman Singh on 3/21/24.
//

import UIKit

protocol TabBarRouterProtocol {
    func showTab(_ tab: TabBarItem)
}

enum TabBarItem {
    case home

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
            let homeViewController = HomeVC(profile: user)
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "home"), selectedImage: UIImage(systemName: "home.fill"))
            
            tabBarController?.viewControllers = [homeViewController]
            // Add more view controllers as needed
        }
    
    func showTab(_ tab: TabBarItem) {
        guard let index = tabBarController?.viewControllers?.firstIndex(where: { viewController in
            switch tab {
            case .home:
                return viewController is HomeVC
            }
        }) else {
            return
        }
        
        tabBarController?.selectedIndex = index
    }
}

