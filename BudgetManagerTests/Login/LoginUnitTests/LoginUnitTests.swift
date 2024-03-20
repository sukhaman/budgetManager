//
//  Created by Sukhaman Singh on 3/17/24.
//

import XCTest
@testable import BudgetManager

class LoginUnitTests: XCTestCase {
    
    func test_loginVC_hasTitle() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("login_view_title")
        let actualTitle = sut.title
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_emailTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("email")
        let actualTitle = sut.emailTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_passwordTextFieldHasPlacholder() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("password")
        let actualTitle = sut.passwordTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_forgotPasswordButtonHasTitle() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("forgot_password")
        let actualTitle = sut.forgotPasswordButton.titleLabel?.text
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_signInButtonHasTitle() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("sign_in")
        let actualTitle = sut.signInButton.titleLabel?.text
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_signUpButtonHasTitle() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let expectedTitle = localized("create_account")
        let actualTitle = sut.signupButton.titleLabel?.text
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_signUpButtonTapped_shouldNavigateToCreateAccountVC() {
       
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        sut.signupButton.sendActions(for: .touchUpInside)
        let topVC = mockNavigation.pushedViewController as? CreateAccountVC
        topVC?.loadViewIfNeeded()
        XCTAssertNotNil(topVC)
    }
    
    
    // Helpers:
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> LoginVC {
        let viewController = LoginUIComposer.composedLogin(viewModel: LoginViewModel(loginLoader: APILoginLoaderSpy()))
        return viewController
    }
    
    private func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = "Login"
        let bundle = Bundle(for: LoginPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}
