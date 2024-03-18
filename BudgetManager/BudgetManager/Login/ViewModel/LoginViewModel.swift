//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var isLoading = false
    @Published var loginError: Error?
    
    private let loginLoader: LoginLoader
    private var cancellables = Set<AnyCancellable>()
    
    init(loginLoader: LoginLoader) {
        self.loginLoader = loginLoader
    }
    
    func login(_ email: String, password: String) {
        isLoading = true
        loginLoader.login(email: email, password: password)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.loginError = error
                case .finished:
                    break
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }
}
