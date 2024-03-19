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
    
}


enum CreateAccountValidationError: LocalizedError {
   
    case enterName
    case tooShortName
    var errorDescription: String? {
        switch self {
        case .enterName:
            return "Please enter name"
        case .tooShortName:
            return "Full name is too short"
        }
    }
}
