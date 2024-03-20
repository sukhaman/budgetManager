//
//  Created by Sukhaman Singh on 3/20/24.
//

import XCTest
@testable import BudgetManager

class LoginLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Login"
        let bundle = Bundle(for: LoginPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
