//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation
import Combine
@testable import BudgetManager

class APILoginLoaderSpy: LoginLoader {
    
    func login(from request: URLRequest) -> AnyPublisher<BudgetManager.User, any Error> {
        if request.allHTTPHeaderFields?.isEmpty == false {
            let publisher = Result<User,Error>.Publisher(.success(User(email: "good@email.com", username: "Any username")))
                .eraseToAnyPublisher()
            return publisher
        } else {
            let publisher = Result<User,Error>.Publisher(.failure(MockError(mockError: "Invalid Request")))
                .eraseToAnyPublisher()
            return publisher
        }
    }
}
