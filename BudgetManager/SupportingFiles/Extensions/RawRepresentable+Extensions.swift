//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

extension RawRepresentable where RawValue == String, Self: APIProtocol {
    var url: URL { Self.baseUrl.appendingPathComponent(rawValue, conformingTo: .data)}
}
