//
//  JDSegueScaleOut.swift
//  JDSegues
//
//  Created by Jan Dammshäuser on 29.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Segue where the current screen scales out to a point or the center of the screen.
@objc
open class JDSegueScaleOut: UIStoryboardSegue, JDSegueOriginable {
    
    /// Defines at which point the animation should start
    /// - parameter Default: center of the screen
    open var animationOrigin: CGPoint?
    
    /// Time the transition animation takes
    /// - parameter Default: 0.5 seconds
    open var transitionTime: TimeInterval = 0.5
    
    /// Animation Curve
    /// - parameter Default: CurveLinear
    open var animationOption: UIViewAnimationOptions = .curveLinear
    
    
    open override func perform() {
        let fromVC = source
        let toVC = destination
        
        fromVC.view.window!.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        JDAnimationScale.out(fromVC: fromVC, toVC: toVC, duration: transitionTime, options: animationOption) { _ in
            self.finishSegue(nil)
        }
        
    }
}
