//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var isLoading = false
    @Published var loginError: Error?
    @Published var userProfile: User?
    private let loginLoader: LoginLoader
    private var cancellables = Set<AnyCancellable>()
    
    init(loginLoader: LoginLoader) {
        self.loginLoader = loginLoader
    }
    
    func login(_ email: String, password: String) {
        loginError = nil
        userProfile = nil
        isLoading = true
        let loginRequest = LoginRequest(email: email, password: password)
        var request = URLRequest(url: LoginEndpoint.post.url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Accept": "application/json","Content-Type": "application/json"]
        request.httpBody = try? JSONEncoder().encode(loginRequest)
        loginLoader.login(from: request)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.loginError = error
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] user in
                self?.userProfile = user
            })
            .store(in: &cancellables)
    }
}
