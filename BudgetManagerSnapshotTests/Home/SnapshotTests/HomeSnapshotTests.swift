//
//  Created by Sukhaman Singh on 3/22/24.
//

import XCTest
@testable import BudgetManager


class HomeSnapshotTests: XCTestCase {
    
    func test_homeVC_iPhoneDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "HOME_VIEW_IPHONE")
    }
    
    func test_loginVC_iPadDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "HOME_VIEW_iPAD")
    }
    
    
    // MARK: Helpers
    
    private func makeSUT() -> HomeVC {
        let viewController = HomeVC(profile: User(email: "ams", username: "John Doe"))
        return viewController
    }
}
