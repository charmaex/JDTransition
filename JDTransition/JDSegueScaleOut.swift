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
open class JDSegueScaleOut: UIStoryboardSegue, JDSegueDelayable, JDSegueOriginable {
    
    /// Defines at which point the animation should start
    /// - parameter Default: center of the screen
    open var animationOrigin: CGPoint?
    
    /// Time the transition animation takes
    /// - parameter Default: 0.5 seconds
    open var transitionTime: TimeInterval = 0.5
    
    /// Time the transition animation is delayed after calling
    /// - parameter Default: 0 seconds
    open var transitionDelay: TimeInterval = 0
    
    /// Animation Curve
    /// - parameter Default: CurveLinear
    open var animationOption: UIViewAnimationOptions = .curveLinear
    
    
    open override func perform() {
        let sourceVC = source
        let destinationVC = destination
        
        setupScreens()
        
        delay() {
            sourceVC.view.window!.insertSubview(destinationVC.view, belowSubview: sourceVC.view)
        
            UIView.animate(withDuration: self.transitionTime, delay: 0, options: self.animationOption, animations: {
                
                if let center = self.animationOrigin {
                    sourceVC.view.center = center
                }
                
                sourceVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
                
            }) { finished in
                
                self.finishSegue() {
                    sourceVC.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
    }
}
