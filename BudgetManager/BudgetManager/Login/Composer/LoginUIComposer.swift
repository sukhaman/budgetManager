//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

struct LoginUIComposer {
    public static func composedLogin(viewModel: LoginViewModel) -> LoginVC {
        let loginController = makeLoginVC(LoginPresenter.title)
        loginController.viewModel = viewModel
        return loginController
    }
    
    private static func makeLoginVC(_ title: String) -> LoginVC {
        let viewController = LoginVC()
        viewController.title = title
        return viewController
    }
}
