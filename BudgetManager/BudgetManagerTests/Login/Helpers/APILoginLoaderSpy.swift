//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation
import Combine
@testable import BudgetManager

class APILoginLoaderSpy: LoginLoader {
    
    func login(from request: URLRequest) -> AnyPublisher<BudgetManager.User, any Error> {
            let data = request.httpBody
        // MARK: Forcefully wrap data because it should be never be nil when Login Request is sent
            let loginUser = try? JSONDecoder().decode(LoginRequest.self, from: data!)
            if loginUser?.email == "good@email.com" {
                let publisher = Result<User,Error>.Publisher(.success(User(email: "good@email.com", username: "Any username")))
                    .eraseToAnyPublisher()
                return publisher
            } else {
                let publisher = Result<User,Error>.Publisher(.failure(MockError(mockError: "Incorrect email or password entered")))
                    .eraseToAnyPublisher()
                return publisher
            }
        
    }
}
