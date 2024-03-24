//
//  Created by Sukhaman Singh on 3/24/24.
//

import XCTest
@testable import BudgetManager

class MonthlySpendingSnapshotTests: XCTestCase {
    
    func test_spendingOverviewVC_iPhoneDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "SPENDING_OVERVIEW_IPHONE")
    }
    
    func test_spendingOverviewVC_iPadDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "SPENDING_OVERVIEW_iPAD")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> SpendingOverviewVC {
        let viewControler = SpendingOverviewVC()
        return viewControler
    }
}
