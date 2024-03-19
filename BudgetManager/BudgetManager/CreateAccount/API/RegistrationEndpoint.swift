//
//  Created by Sukhaman Singh on 3/18/24.
//

import Foundation

enum RegistrationEndpoint: RawRepresentable,APIProtocol {
    init?(rawValue: String) { nil }
    
    static internal let baseUrl = URL(string: "https://google.com/")!
    case registration
   
    var rawValue: String {
        switch self {
            
            case .registration: return "api/v1/registration"
        }
    }
}
