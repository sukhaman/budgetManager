//
//  Created by Sukhaman Singh on 3/17/24.
//

import XCTest
@testable import BudgetManager

class LoginIntegrationTests: XCTestCase {
    
    func test_loginVC_shouldThrowMissingEmailAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.signInButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        XCTAssertNotNil(alertController)
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> LoginVC {
        let view = LoginUIComposer.composedLogin()
        return view
    }
}
