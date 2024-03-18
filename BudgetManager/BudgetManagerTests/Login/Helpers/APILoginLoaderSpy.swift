//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation
import Combine
@testable import BudgetManager

class APILoginLoaderSpy: LoginLoader {
    
    func login(email: String, password: String) -> AnyPublisher<BudgetManager.User, any Error> {
        let publisher = Result<User,Error>.Publisher(.failure(MockError(mockError: "Invalid Request")))
            .eraseToAnyPublisher()
        return publisher
    }
}
