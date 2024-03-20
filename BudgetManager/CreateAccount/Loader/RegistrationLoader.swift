//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation
import Combine

protocol RegistrationLoader {
    func register(from request: URLRequest) -> AnyPublisher<User, Error>
}

class APIRegistrationLoader: RegistrationLoader {
    
    func register(from request: URLRequest) -> AnyPublisher<User, any Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, _ in data }
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
