//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

public final class LoginPresenter {
    public static var title: String {
        NSLocalizedString("login_view_title",tableName: "Login",bundle: Bundle(for: Self.self), comment: "Title for the Login view")
    }
    
    public static var email: String {
        NSLocalizedString("email",tableName: "Login",bundle: Bundle(for: Self.self), comment: "Placholder for the Email TextField")
    }
    
    public static var password: String {
        NSLocalizedString("password",tableName: "Login",bundle: Bundle(for: Self.self), comment: "Placholder for the Password TextField")
    }
    
    public static var forgotPassword: String {
        NSLocalizedString("forgot_password",tableName: "Login",bundle: Bundle(for: Self.self), comment: "Title for the Forgot Password Button")
    }
    
    public static var signin: String {
        NSLocalizedString("sign_in",tableName: "Login",bundle: Bundle(for: Self.self), comment: "Title for the sign in button")
    }
    
    public static var signup: String {
        NSLocalizedString("create_account",tableName: "Login",bundle: Bundle(for: Self.self), comment: "Title for the Create Account button")
    }
}
