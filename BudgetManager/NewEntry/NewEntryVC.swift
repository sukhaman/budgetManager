//
//  Created by Sukhaman Singh on 3/28/24.
//

import UIKit

class NewEntryVC: UIViewController {
    
    var labelTitle: UILabel = {
       let label = UILabel()
        label.text = "What do you want to add?"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var buttonCancel: UIButton = {
       let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(BudgetManagerColors.primaryGreen.color, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white
        
        view.addSubview(buttonCancel)
        view.addSubview(labelTitle)
        
        NSLayoutConstraint.activate([
            buttonCancel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            buttonCancel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            buttonCancel.widthAnchor.constraint(equalToConstant: 50),
            buttonCancel.heightAnchor.constraint(equalToConstant: 30),
            
            labelTitle.trailingAnchor.constraint(equalTo: self.buttonCancel.leadingAnchor, constant: -5),
            labelTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            buttonCancel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}


extension NewEntryVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BottomPresentationAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
