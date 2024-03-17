//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

struct LoginUIComposer {
    public static func composedLogin() -> LoginVC {
        let loginController = makeLoginVC(LoginPresenter.title)
        return loginController
    }
    
    private static func makeLoginVC(_ title: String) -> LoginVC {
        let viewController = LoginVC()
        viewController.title = title
        return viewController
    }
}
