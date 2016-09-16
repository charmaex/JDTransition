//
//  JDSegueScaleIn.swift
//  JDSegues
//
//  Created by Jan Dammshäuser on 28.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Segue where the next screen scales in from a point or the center of the screen.
@objc
open class JDSegueScaleIn: UIStoryboardSegue, JDSegueDelayable, JDSegueOriginable {
    
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
        let destCenter = sourceVC.view.center
        
        setupScreens()
        
        destinationVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        
        if let center = animationOrigin {
            destinationVC.view.center = center
        }
        
        delay() {
            sourceVC.view.addSubview(destinationVC.view)
            
            UIView.animate(withDuration: self.transitionTime, delay: 0, options: self.animationOption, animations: {
                
                destinationVC.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                destinationVC.view.center = destCenter
                
            }) { finished in
                self.finishSegue(nil)
            }
        }
    }
}
