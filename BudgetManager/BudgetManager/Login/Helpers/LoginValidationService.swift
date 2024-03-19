//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

struct LoginValidationService {
    
    func validateUserEmail(_ userEmail: String?) throws -> String {
        guard let userEmail = userEmail, !userEmail.isEmpty else {
            throw ValidationError.enterEmail
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: userEmail) {
           throw ValidationError.invalidEmail
        }
        return userEmail
    }
    
    func validateUserPassword(_ password: String?) throws -> String {
        guard let password = password, !password.isEmpty else {
            throw ValidationError.enterPassword
        }
        return password
    }
}


enum ValidationError: LocalizedError {
   
    case enterEmail
    case invalidEmail
    case enterPassword
    
    var errorDescription: String? {
        switch self {
        case .enterEmail:
            return "Please enter email"
        case .invalidEmail:
            return "You have entered invalid email"
        case .enterPassword:
            return "Please enter password"
        }
    }
}
