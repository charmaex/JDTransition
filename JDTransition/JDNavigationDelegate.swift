//
//  JDNavigationDelegate.swift
//  JDTransition
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Override class, pushAnimator() and popAnimator() to customize transitions
open class JDNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    // MARK: - UINavigationControllerDelegate
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .pop:
            return popAnimator()
        case .push:
            return pushAnimator()
        case .none:
            return nil
        }
    }
    
    // MARK: - Open Methods
    
    /// Override to use custom pop transitions
    /// - parameter Default: calls pushAnimator
    open func popAnimator() -> JDAnimator? {
        return pushAnimator()
    }
    
    /// Override to use custom push transitions
    open func pushAnimator() -> JDAnimator? {
        NSLog("[JDTransition] JDNavigationDelegate.pushAnimator() is not overridden")
        return nil
    }
}
