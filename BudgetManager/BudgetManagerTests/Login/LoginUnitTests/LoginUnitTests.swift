//
//  Created by Sukhaman Singh on 3/17/24.
//

import XCTest
@testable import BudgetManager

class LoginUnitTests: XCTestCase {
    
    func test_loginVC_hasTitle() {
        let sut = makeSUT()
        let expectedTitle = "Login"
        let actualTitle = sut.title
        XCTAssertEqual(expectedTitle, actualTitle)
    }
    
    // Helpers:
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> LoginVC {
        let viewController = LoginUIComposer.composedLogin()
        trackForMemoryLeaks(viewController,file: file,line: line)
        return viewController
    }
}
