//
//  Created by Sukhaman Singh on 3/17/24.
//

import Foundation

class MockError: Error {
    var mockError:String
    init(mockError: String) {
        self.mockError = mockError
    }
}
extension MockError: CustomStringConvertible {
    public var description: String {
        return mockError
    }
}

extension MockError: LocalizedError {
    public var errorDescription: String? {
    return mockError
    }
}

