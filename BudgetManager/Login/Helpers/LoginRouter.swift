//
//  Created by Sukhaman Singh on 3/20/24.
//


import UIKit

enum LoginScreen {
    case login
    case forgotPassword
    case signup
    case home(_ user: User?)
}

protocol LoginRouter {
    
    func showScreen(loginScreen: LoginScreen)
}

class DefaultLoginRouter: LoginRouter {
    weak var navigationControler: UINavigationController?
    
    init(navigationControler: UINavigationController? = nil) {
        self.navigationControler = navigationControler
    }
    
    func showScreen(loginScreen: LoginScreen) {
        switch loginScreen {
        case .login:
            let destVC = LoginUIComposer.composedLogin(viewModel: LoginViewModel(loginLoader: APILoginLoader()))
            navigationControler?.pushViewController(destVC, animated: true)
        case .forgotPassword:
            break
        case .signup:
            let destVC = RegistrationUIComposer.composedRegistration(viewModel: RegistrationViewModel(loader: APIRegistrationLoader()))
            navigationControler?.pushViewController(destVC, animated: true)
        case .home(let user):
            let tabBarController = UITabBarController()
            _ = TabBarRouter(tabBarController: tabBarController, user: user)
            navigationControler?.pushViewController(tabBarController, animated: true)
        }
    }
    func initialViewController() -> UIViewController {
       
        return LoginUIComposer.composedLogin(viewModel: LoginViewModel(loginLoader: APILoginLoader()))
        }

}
