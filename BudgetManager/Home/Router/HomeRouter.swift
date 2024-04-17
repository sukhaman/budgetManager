//
//  Created by Sukhaman Singh on 3/27/24.
//

import UIKit

protocol HomeRouterProtocol {
    func showAddAccount(_ item: HomeItem)
}

enum HomeItem {
    case present
    case addBudget
    
}

class HomeRouter: HomeRouterProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showAddAccount(_ item: HomeItem) {
        switch item {
        case .present:
            let destVC = NewEntryVC()
            destVC.router = self
            destVC.modalPresentationStyle = .custom
            destVC.transitioningDelegate = destVC
            navigationController?.present(destVC, animated: false)
        case .addBudget:
           let destVC = BudgetListVC()
            navigationController?.pushViewController(destVC, animated: false)
        }
    }
}


class CustomPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return CGRect.zero }
        
        let height: CGFloat = containerView.bounds.height / 4
        return CGRect(x: 0, y: containerView.bounds.height - height, width: containerView.bounds.width, height: height)
    }
}

class BottomPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        presentedView.frame = CGRect(x: 0, y: containerView.frame.maxY, width: containerView.bounds.width, height: containerView.bounds.height / 4)
        containerView.addSubview(presentedView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.frame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}


