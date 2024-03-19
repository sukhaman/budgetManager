//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation
import Combine

class RegistrationViewModel {
    @Published var error: Error?
    @Published var userProfile: User?
    private var loader: RegistrationLoader
    private var cancellables: Set<AnyCancellable> = []
    init(loader: RegistrationLoader) {
        self.loader = loader
    }
    
    func register(_ name: String, _ email: String, _ password:String) {
        error = nil
        userProfile = nil
        let registrationUser = RegistrationUserRequest(name: name, email: email, password: password)
        var request = URLRequest(url: RegistrationEndpoint.registration.url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Accept": "application/json","Content-Type": "application/json"]
        request.httpBody = try? JSONEncoder().encode(registrationUser)
        let publisher = loader.register(from: request)
        publisher.sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.error = error
            case .finished:
                break
            }
        } receiveValue: { [weak self] user in
            self?.userProfile = user
        }
            .store(in: &cancellables)

        
    }
}
