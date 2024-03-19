//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation
import Combine

class RegistrationViewModel {
    @Published var error: Error?
    private var loader: RegistrationLoader
    private var cancellables: Set<AnyCancellable> = []
    init(loader: RegistrationLoader) {
        self.loader = loader
    }
    
    func register() {
        error = nil
        var request = URLRequest(url: RegistrationEndpoint.registration.url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Accept": "application/json","Content-Type": "application/json"]
        let publisher = loader.register(from: request)
        publisher.sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.error = error
            case .finished:
                break
            }
        } receiveValue: { _ in }
            .store(in: &cancellables)

        
    }
}
