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
    
    func test_createAccount_shouldThrowShortFullNameAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.nameTextField.text = "Any"
        sut.signupButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        let expectedMessage = CreateAccountValidationError.tooShortName.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_createAccount_shouldThrowEnterEmailAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.nameTextField.text = "Good Name"
        sut.signupButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        let expectedMessage = CreateAccountValidationError.enterEmail.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_createAccount_shouldThrowInvalidEmailAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.nameTextField.text = "Good Name"
        sut.emailTextField.text = "asdas"
        sut.signupButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        let expectedMessage = CreateAccountValidationError.invalidEmail.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_createAccount_shouldThrowEnterPasswordlAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.nameTextField.text = "Good Name"
        sut.emailTextField.text = "asdas@test.com"
        sut.signupButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        let expectedMessage = CreateAccountValidationError.enterPassword.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_createAccount_shouldThrowTooShorPasswordlAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.nameTextField.text = "Good Name"
        sut.emailTextField.text = "asdas@test.com"
        sut.passwordTextField.text = "1234"
        sut.signupButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        let expectedMessage = CreateAccountValidationError.tooShortPassword.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_createAccount_sendCreateAccountRequestFinishWithError() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.nameTextField.text = "Good Name"
        sut.emailTextField.text = "asdas@test.com"
        sut.passwordTextField.text = "test1234"
        sut.signupButton.sendActions(for: .touchUpInside)
        let expectation = XCTestExpectation(description: "Server response received")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        let expectedMessage = "Invalid request"
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    // Helpers:
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> CreateAccountVC {
        let viewModel = RegistrationViewModel(loader: APIRegistrationLoaderSpy())
        let viewController = RegistrationUIComposer.composedRegistration(viewModel: viewModel)
        return viewController
    }
}
