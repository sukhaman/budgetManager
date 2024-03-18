//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation
import Combine

protocol LoginLoader {
    func login(email: String, password: String) -> AnyPublisher<User, Error>
}

struct APILoginLoader: LoginLoader {
    func login(email: String, password: String) -> AnyPublisher<User, Error> {
        // Simulate network request
        return URLSession.shared.dataTaskPublisher(for: LoginEndpoint.post.url)
            .map { data, _ in data }
            .decode(type: User.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
