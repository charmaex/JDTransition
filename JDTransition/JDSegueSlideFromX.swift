//
//  JDSegueSlideFromX.swift
//  JDSegues
//
//  Created by Jan Dammshäuser on 29.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Segue where the next screen slides in from left.
@objc
open class JDSegueSlideFromLeft: JDSegueSlideFromRight {
    override var direction: JDAnimationSlideFrom.Direction {
        return .left
    }
}

/// Segue where the next screen slides in from top.
@objc
open class JDSegueSlideFromTop: JDSegueSlideFromRight {
    override var direction: JDAnimationSlideFrom.Direction {
        return .top
    }
}

/// Segue where the next screen slides in from bottom.
@objc
open class JDSegueSlideFromBottom: JDSegueSlideFromRight {
    override var direction: JDAnimationSlideFrom.Direction {
        return .bottom
    }
}

/// Segue where the next screen slides in from right.
@objc
open class JDSegueSlideFromRight: UIStoryboardSegue, JDSegueProtocol {
    
    /// Time the transition animation takes
    /// - parameter Default: 0.5 seconds
    open var transitionTime: TimeInterval = 0.5
    
    /// Animation Curve
    /// - parameter Default: CurveLinear
    open var animationOption: UIViewAnimationOptions = .curveLinear
    
    var direction: JDAnimationSlideFrom.Direction {
        return .right
    }
    
    open override func perform() {
        let fromVC = source
        let toVC = destination
        
        fromVC.view.window!.addSubview(toVC.view)
        
        switch direction {
        case .left: JDAnimationSlideFrom.left(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: animationOption) { [weak self] _ in self?.finishSegue(nil) }
        case .right: JDAnimationSlideFrom.right(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: animationOption) { [weak self] _ in self?.finishSegue(nil) }
        case .bottom: JDAnimationSlideFrom.bottom(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: animationOption) { [weak self] _ in self?.finishSegue(nil) }
        case .top: JDAnimationSlideFrom.top(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: animationOption) { [weak self] _ in self?.finishSegue(nil) }
        }
    }
}
