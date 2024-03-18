//
//  Created by Sukhaman Singh on 3/18/24.
//

import UIKit

class HomeVC: UIViewController {
    
    public private (set) var profile: User?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(profile: User? = nil) {
        self.init()
        self.profile = profile
    }
}
