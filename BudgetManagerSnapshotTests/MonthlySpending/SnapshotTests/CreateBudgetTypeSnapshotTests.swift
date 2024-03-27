//
//  Created by Sukhaman Singh on 3/25/24.
//

import XCTest
@testable import BudgetManager

class CreateBudgetTypeSnapshotTests: XCTestCase {
    
    func test_createBudgetTypeVC_iPhoneDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "CREATE_BUDGET_IPHONE")
    }
    
    func test_createBudgetTypeVC_iPadDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "CREATE_BUDGET_iPAD")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> CreateBudgetTypeVC {
        let viewControler = CreateBudgetTypeVC()
        viewControler.budgetType = BudgetType(id: 2, type: "Rent", limitAmount: 1230, spentAmount: 1200, color: .red)
        return viewControler
    }
}
