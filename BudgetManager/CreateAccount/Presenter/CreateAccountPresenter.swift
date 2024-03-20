//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

public final class CreateAccountPresenter {
    
    public static var name: String {
        NSLocalizedString("name",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Title for the Create Account button")
    }
    
    public static var email: String {
        NSLocalizedString("email",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Placholder for the Email TextField")
    }
    
    public static var password: String {
        NSLocalizedString("password",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Placholder for the Password TextField")
    }
    
    public static var signup: String {
        NSLocalizedString("sign_up",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Title for the Sign Up button")
    }
    
    public static var privacyPolicy: String {
        NSLocalizedString("privacy_policy",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Title for the Create Account button")
    }
    
    public static var termsCondition: String {
        NSLocalizedString("term_condition",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Title for the Create Account button")
    }
    
    public static var and: String {
        NSLocalizedString("and",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Title for the Create Account button")
    }
    
    public static var agree: String {
        NSLocalizedString("you_agree_to",tableName: "CreateAccount",bundle: Bundle(for: Self.self), comment: "Title for the Create Account button")
    }
}
