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
    func showAlert(_ message: String)
}

class DefaultLoginRouter: LoginRouter {
    weak var navigationController: UINavigationController?
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showScreen(loginScreen: LoginScreen) {
        switch loginScreen {
        case .login:
            let destVC = LoginUIComposer.composedLogin(viewModel: LoginViewModel(loginLoader: APILoginLoader()))
            navigationController?.pushViewController(destVC, animated: true)
        case .forgotPassword:
            break
        case .signup:
            let destVC = RegistrationUIComposer.composedRegistration(viewModel: RegistrationViewModel(loader: APIRegistrationLoader()))
            navigationController?.pushViewController(destVC, animated: true)
        case .home(let user):
            let tabBarController = UITabBarController()
            _ = TabBarRouter(tabBarController: tabBarController, user: user)
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarController)
        }
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController (title: nil, message:message, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "OK", style:  .default , handler: { (actionSheetController) -> Void in
            
        })
        alertController.addAction(OkAction)
        navigationController?.present(alertController, animated: true , completion: nil)
    }
    func initialViewController() -> UIViewController {
       
        return LoginUIComposer.composedLogin(viewModel: LoginViewModel(loginLoader: APILoginLoader()))
        }

}
