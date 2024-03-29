//
//  Created by Sukhaman Singh on 3/24/24.
//


import XCTest
@testable import BudgetManager

class MonthlyBudgetInfoUnitTests: XCTestCase {
    
    func test_spendingOverviewVC_cellAtFirstSectionCell() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        
        let cell = sut.cell(row: 0, section: 0) as? MonthlyBudgetInfoCell
        XCTAssertNotNil(cell)
        
    }
    
    func test_spendingOverviewVC_cellAtRestOfSectionsCell() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        
        let cell = sut.cell(row: 0, section: 2) as? BudgetTypeViewCell
        XCTAssertNotNil(cell)
        
    }
    
    func test_spendingOverviewVC_cellEditTappedShowBudgetEditScreen() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let navigation = UINavigationController()
        let router = BudgetRouter(navigationController: navigation)
        sut.router = router
        let cell = sut.cell(row: 0, section: 2) as? BudgetTypeViewCell
        cell?.buttonEdit.sendActions(for: .touchUpInside)
        let topVC = navigation.topViewController as? CreateBudgetTypeVC
        topVC?.loadViewIfNeeded()
        XCTAssertNotNil(topVC)
        XCTAssertNotNil(topVC?.budgetType)
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> BudgetSpendingOverviewVC {
        let viewControler = BudgetSpendingOverviewVC()
        return viewControler
    }
}
