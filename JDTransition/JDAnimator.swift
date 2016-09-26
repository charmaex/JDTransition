//
//  JDAnimator.swift
//  JDTransition
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class JDAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using context: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using context: UIViewControllerContextTransitioning) {
        guard let toVC = context.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            NSLog("[JDTransition] No toVC")
            return
        }
        guard let fromVC = context.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            NSLog("[JDTransition] No toVC")
            return
        }
        context.containerView.addSubview(toVC.view)
        
        JDAnimationSlideFrom.left(fromVC: fromVC, toVC: toVC) { _ in
            context.completeTransition(!context.transitionWasCancelled)
        }
    }
}
