//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation
import XCTest
@testable import BudgetManager

class CreateAccountIntegrationTests: XCTestCase {
    
    func test_createAccount_shouldThrowEnterNameAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.signupButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        let expectedMessage = CreateAccountValidationError.enterName.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    // Helpers:
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> CreateAccountVC {
        let viewController = CreateAccountVC()
        return viewController
    }
}
