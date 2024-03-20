//
//  Created by Sukhaman Singh on 3/17/24.
//


import XCTest
@testable import BudgetManager

class CreateSnapshotTests: XCTestCase {
    
    func test_createAccountVC_iPhoneDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
     //   assert(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "CREATE_ACCOUNT_DARK_VIEW_iPhone")
     //   assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "CREATE_ACCOUNT_LIGHT_VIEW_iPhone")
    }
    
    func test_createAccountVC_iPadDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
     //   assert(snapshot: sut.snapshot(for: .iPad(style: .dark)), named: "CREATE_ACCOUNT_DARK_VIEW_iPad")
     //   assert(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "CREATE_ACCOUNT_LIGHT_VIEW_iPad")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> CreateAccountVC {
        let view = CreateAccountVC()
        return view
    }
}
