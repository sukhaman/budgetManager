//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation

struct CreateAccountValidationService {
    
    func validateUsername(_ name: String?) throws -> String {
        guard let name = name, !name.isEmpty else {
            throw CreateAccountValidationError.enterName
        }
        if name.count < 4 {
           throw CreateAccountValidationError.tooShortName
        }
        return name
    }
    
    func validateUserEmail(_ userEmail: String?) throws -> String {
        guard let userEmail = userEmail, !userEmail.isEmpty else {
            throw CreateAccountValidationError.enterEmail
        }
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailTest.evaluate(with: userEmail) {
               throw CreateAccountValidationError.invalidEmail
            }
        return userEmail
    }
}


enum CreateAccountValidationError: LocalizedError {
   
    case enterName
    case tooShortName
    case enterEmail
    case invalidEmail
    var errorDescription: String? {
        switch self {
        case .enterName:
            return "Please enter name"
        case .tooShortName:
            return "Full name is too short"
        case .enterEmail:
            return "Please enter email"
        case .invalidEmail:
            return "You have entered invalid email"
        }
    }
}
