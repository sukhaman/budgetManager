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
    
    // MARK: Helpers
    
    private func makeSUT() -> SpendingOverviewVC {
        let viewControler = SpendingOverviewVC()
        return viewControler
    }
}
