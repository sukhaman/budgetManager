//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

struct LoginRequest: Codable {
    var email: String
    var password: String
    
    enum CodingKeys: CodingKey {
        case email
        case password
    }
}

struct User: Codable {
    var email: String
    var username: String
    
    enum CodingKeys: CodingKey {
        case email
        case username
    }
}
