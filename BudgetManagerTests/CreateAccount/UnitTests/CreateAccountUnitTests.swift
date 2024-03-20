//
//  Created by Sukhaman Singh on 3/17/24.
//


import XCTest
@testable import BudgetManager

class CreateAccountUnitTests: XCTestCase {
    
    func test_createAccount_titleLabelHasText() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("sign_up")
        let actualTitle = sut.titleLabel.text
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_nameTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("name")
        let actualTitle = sut.nameTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_emailTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("email")
        let actualTitle = sut.emailTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_passwordTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("password")
        let actualTitle = sut.passwordTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_signUpButtonHasTitle() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("sign_up")
        let actualTitle = sut.signupButton.titleLabel?.text
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_createAccount_privacyTextVewHasText() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.privacyTextView.attributedText)
    }
    
    // Helpers:
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> CreateAccountVC {
        let viewController = CreateAccountVC()
        return viewController
    }
    
    private func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = "CreateAccount"
        let bundle = Bundle(for: LoginPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}


