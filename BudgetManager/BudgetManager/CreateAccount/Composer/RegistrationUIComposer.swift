//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation

struct RegistrationUIComposer {
    public static func composedRegistration(viewModel: RegistrationViewModel) -> CreateAccountVC {
        let registrationController = makeRegistrationVC()
        registrationController.viewModel = viewModel
        return registrationController
    }
    
    private static func makeRegistrationVC() -> CreateAccountVC {
        let viewController = CreateAccountVC()
        return viewController
    }
}
