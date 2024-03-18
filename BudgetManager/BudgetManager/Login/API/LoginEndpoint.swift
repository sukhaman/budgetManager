//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

protocol APIProtocol {
    static var baseUrl: URL {get}
}

enum LoginEndpoint: RawRepresentable,APIProtocol {
    init?(rawValue: String) { nil }
    
    static let baseUrl = URL(string: "https://google.com/")!
    case post
   
    var rawValue: String {
        switch self {
            
            case .post: return "api/v1/auth/token/access/"
        }
    }
}
