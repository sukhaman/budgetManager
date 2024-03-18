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
        let expectedMessage = ValidationError.enterEmail.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_loginVC_shouldThrowMissingInvalidEmailAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.emailTextField.text = "hdaks"
        sut.signInButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        XCTAssertNotNil(alertController)
        let expectedMessage = ValidationError.invalidEmail.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_loginVC_shouldThrowMissingInvalidPasswordAlert() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.emailTextField.text = "valid@email.com"
        sut.signInButton.sendActions(for: .touchUpInside)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        XCTAssertNotNil(alertController)
        let expectedMessage = ValidationError.enterPassword.localizedDescription
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_loginVC_loginRequestMade_shouldFinishWithError() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.emailTextField.text = "valid@email.com"
        sut.passwordTextField.text = "password"
        sut.signInButton.sendActions(for: .touchUpInside)
        let expectation = XCTestExpectation(description: "Wait for server response")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        XCTAssertNotNil(alertController)
        let expectedMessage = "Incorrect email or password entered"
        let actualMessage = alertController?.message
        XCTAssertEqual(expectedMessage, actualMessage)
    }
    
    func test_loginVC_loginRequestMade_shouldFinishWithSuccess() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.emailTextField.text = "good@email.com"
        sut.passwordTextField.text = "password"
        sut.signInButton.sendActions(for: .touchUpInside)
        let expectation = XCTestExpectation(description: "Wait for server response")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        let topVC = mockNavigation.pushedViewController as? HomeVC
        topVC?.loadViewIfNeeded()
        XCTAssertNotNil(topVC)
        XCTAssertNotNil(topVC?.profile)
    }
    
    
    // MARK: Helpers
    
    private func makeSUT() -> LoginVC {
        let view = LoginUIComposer.composedLogin(viewModel: LoginViewModel(loginLoader: APILoginLoaderSpy()))
        return view
    }
}
