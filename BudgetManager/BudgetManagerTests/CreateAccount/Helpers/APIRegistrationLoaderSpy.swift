//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation
import Combine
@testable import BudgetManager

class APIRegistrationLoaderSpy: RegistrationLoader {
    func register(from request: URLRequest) -> AnyPublisher<BudgetManager.User, any Error> {
        let publisher = Result<User,Error>.Publisher(.failure(MockError(mockError: "Invalid request")))
            .eraseToAnyPublisher()
        return publisher
    }
    
    
}
