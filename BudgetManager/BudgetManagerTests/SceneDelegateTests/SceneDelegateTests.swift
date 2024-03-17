//
//  Created by Sukhaman Singh on 3/17/24.
//

import XCTest
import UIKit
@testable import BudgetManager


class SceneDelegateTests: XCTestCase {
    
    func test_rootViewController() {
        // Arrange
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            XCTFail("Failed to obtain window scene or window")
            return
        }
        let rootViewController = window.rootViewController
        
        // Assert
        let navigationController = rootViewController as? UINavigationController
        let viewController = navigationController?.topViewController as? ViewController
        viewController?.loadViewIfNeeded()
        XCTAssertNotNil(viewController)
    }
}
