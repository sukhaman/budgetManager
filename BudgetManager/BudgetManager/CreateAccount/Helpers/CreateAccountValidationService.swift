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
    
        return userEmail
    }
}


enum CreateAccountValidationError: LocalizedError {
   
    case enterName
    case tooShortName
    case enterEmail
    var errorDescription: String? {
        switch self {
        case .enterName:
            return "Please enter name"
        case .tooShortName:
            return "Full name is too short"
        case .enterEmail:
            return "Please enter email"
        }
    }
}
