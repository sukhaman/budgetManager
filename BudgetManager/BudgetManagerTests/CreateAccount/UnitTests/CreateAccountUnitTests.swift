//
//  Created by Sukhaman Singh on 3/17/24.
//


import XCTest
@testable import BudgetManager

class CreateAccountUnitTests: XCTestCase {
    
    func test_createAccount_titleLabelHasText() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = "Sign Up"
        let actualTitle = sut.titleLabel.text
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_nameTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = "Name"
        let actualTitle = sut.nameTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_emailTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = "Email"
        let actualTitle = sut.emailTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_passwordTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = "Password"
        let actualTitle = sut.passwordTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_signUpButtonHasTitle() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = "Sign Up"
        let actualTitle = sut.signupButton.titleLabel?.text
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_privacyTextVewHasText() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.privacyTextView.attributedText)
    }
    
    func test_createAccount_signUpButtonTapped_shouldNavigateToCreateAccountVC() {
       
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.signupButton.sendActions(for: .touchUpInside)
        let topVC = mockNavigation.pushedViewController as? CreateAccountVC
        topVC?.loadViewIfNeeded()
        XCTAssertNotNil(topVC)
    }
    
    
    // Helpers:
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> CreateAccountVC {
        let viewController = CreateAccountVC()
        return viewController
    }
}
