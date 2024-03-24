//
//  Created by Sukhaman Singh on 3/23/24.
//

import XCTest
@testable import BudgetManager

class BudgetOverviewSnapshotTests: XCTestCase {
    
    func test_budgetOverviewVC_iPhoneDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "BUDGET_OVERVIEW_IPHONE")
    }
    
    func test_budgetOverviewVC_iPadDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "BUDGET_OVERVIEW_iPAD")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> BudgetOverviewVC {
        let viewController = BudgetOverviewVC()
        return viewController
    }
}
