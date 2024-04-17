//
//  Created by Sukhaman Singh on 3/27/24.
//

import XCTest
@testable import BudgetManager

class HomeIntegrationTests: XCTestCase {
    
    func testHomeController_addAccountTapped_shouldShowAddAccountScreen() {
        let user = User(email: "saa@test.com", username: "Anyone")
        let sut = makeSUT(user)
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
        sut.headerView.delegate?.buttonAddTapped()
        let topVC = mockNavigation.presentViewController as? NewEntryVC
        topVC?.loadViewIfNeeded()
        XCTAssertNotNil(topVC)
    }
    
    func testHomeController_addAccountTapped_b() {
        let user = User(email: "saa@test.com", username: "Anyone")
        let sut = makeSUT(user)
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
        sut.headerView.delegate?.buttonAddTapped()
        let topVC = mockNavigation.presentViewController as? NewEntryVC
        topVC?.loadViewIfNeeded()
        XCTAssertNotNil(topVC)
        topVC?.buttonBudget.sendActions(for: .touchUpInside)
        let budgetVC = mockNavigation.pushedViewController as? BudgetListVC
        budgetVC?.loadViewIfNeeded()
        XCTAssertNotNil(budgetVC)
    }
    
    // MARK: Helpers
    
    private func makeSUT(_ user: User) -> HomeVC {
        let viewController = HomeVC()
        return viewController
    }
}
