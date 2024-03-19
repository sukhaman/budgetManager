//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation

struct CreateAccountValidationService {
    
    func validateUsername(_ name: String?) throws -> String {
        guard let name = name, !name.isEmpty else {
            throw CreateAccountValidationError.enterName
        }
        return name
    }
    
}


enum CreateAccountValidationError: LocalizedError {
   
    case enterName
    
    var errorDescription: String? {
        switch self {
        case .enterName:
            return "Please enter name"
        }
    }
}
