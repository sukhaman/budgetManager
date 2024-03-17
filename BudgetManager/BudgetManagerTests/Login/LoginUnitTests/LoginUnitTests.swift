//
//  Created by Sukhaman Singh on 3/17/24.
//

import XCTest
@testable import BudgetManager

class LoginUnitTests: XCTestCase {
    
    func test_loginVC_hasTitle() {
        let sut = makeSUT()
        let expectedTitle = "Sign in"
        let actualTitle = sut.title
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_emailTextFieldHasPlacholder() {
        let sut = makeSUT()
        let expectedTitle = "Email"
        let actualTitle = sut.emailTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    func test_loginVC_passwordTextFieldHasPlacholder() {
        let sut = makeSUT()
        let expectedTitle = "Password"
        let actualTitle = sut.passwordTextField.placeholder
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    
    // Helpers:
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> LoginVC {
        let viewController = LoginUIComposer.composedLogin()
        trackForMemoryLeaks(viewController,file: file,line: line)
        return viewController
    }
}
