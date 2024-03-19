//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation
import Combine
@testable import BudgetManager

class APIRegistrationLoaderSpy: RegistrationLoader {
    func register(from request: URLRequest) -> AnyPublisher<BudgetManager.User, any Error> {
        let data = request.httpBody
        let registrationUser = try? JSONDecoder().decode(RegistrationUserRequest.self, from: data!)
        if registrationUser?.password == "test1234" {
            let publisher = Result<User,Error>.Publisher(.failure(MockError(mockError: "Invalid request")))
                .eraseToAnyPublisher()
            return publisher
        } else {
            let publisher = Result<User,Error>.Publisher(.success(createUserObject()))
                .eraseToAnyPublisher()
            return publisher
        }
    }
    
    // MARK: Helper
    
    private func createUserObject() -> User {
        User(email: "good@email.com", username: "Good Name")
    }
    
}
