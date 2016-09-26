//
//  JDAnimator.swift
//  JDTransition
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// This class provides all JDTransition animations
public class JDAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Private Data
    
    private var animation: AnimationType = .slideFromRight
    private var transitionTime: TimeInterval = 0.4
    private var transitionOptions: UIViewAnimationOptions?
    
    // MARK: - Public Data
    
    /// Active animation type
    public var animationType: AnimationType {
        return animation
    }
    
    /// All animation types of JDTransition
    public enum AnimationType {
        case slideFromLeft, slideFromRight, slideFromBottom, slideFromTop
    }
    
    private func animate(from fromVC: UIViewController, to toVC: UIViewController, completion: @escaping () -> ()) {
        
        switch animation {
        case .slideFromLeft: JDAnimationSlideFrom.left(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: transitionOptions) { _ in completion() }
        case .slideFromRight: JDAnimationSlideFrom.right(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: transitionOptions) { _ in completion() }
        case .slideFromBottom: JDAnimationSlideFrom.bottom(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: transitionOptions) { _ in completion() }
        case .slideFromTop: JDAnimationSlideFrom.top(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: transitionOptions) { _ in completion() }
        }
    }
    
    // MARK: - Setup
    
    /// Set the animation type.
    /// - parameter type: default is slideFromRight
    public func animationType(setTo type: AnimationType) {
        animation = type
    }
    
    /// Set the duration of the animation.
    /// - parameter setTo: default is 0.4
    public func transitionDuration(setTo time: TimeInterval) {
        transitionTime = time
    }
    
    /// Set the delay of the animation.
    /// - Set nil keep default transitions defaults
    /// - parameter options: default is nil
    public func transitionOptions(setTo options: UIViewAnimationOptions?) {
        transitionOptions = options
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning

    public func transitionDuration(using context: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionTime
    }

    public func animateTransition(using context: UIViewControllerContextTransitioning) {
        guard let toVC = context.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            NSLog("[JDTransition] JDAnimator has no toVC")
            return
        }
        
        guard let fromVC = context.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            NSLog("[JDTransition] JDAnimator has no fromVC")
            return
        }

        context.containerView.addSubview(toVC.view)
        
        animate(from: fromVC, to: toVC) {
            context.completeTransition(!context.transitionWasCancelled)
        }
    }
}
