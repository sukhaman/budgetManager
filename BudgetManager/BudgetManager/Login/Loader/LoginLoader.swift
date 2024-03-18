//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation
import Combine

protocol LoginLoader {
    func login(from request: URLRequest) -> AnyPublisher<User, Error>
}

struct APILoginLoader: LoginLoader {
    func login(from request: URLRequest) -> AnyPublisher<User, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, _ in data }
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
