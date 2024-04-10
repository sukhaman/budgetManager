//
//  Created by Sukhaman Singh on 4/9/24.
//

import XCTest
@testable import BudgetManager

class AddTransactionSnapshotTests: XCTestCase {
    
    func test_addTransactionVC_iPhoneDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "ADD_TRANSACTION_IPHONE")
    }
    
    func test_addTransactionVC_iPadDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "ADD_TRANSACTION_iPAD")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> AddTransactionVC {
        let viewControler = AddTransactionVC()
        return viewControler
    }
}
