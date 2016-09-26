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
open class JDSegueSlideFromRight: UIStoryboardSegue, JDSegueDelayable {
    
    /// Time the transition animation takes
    /// - parameter Default: 0.5 seconds
    open var transitionTime: TimeInterval = 0.5
    
    /// Time the transition animation is delayed after calling
    /// - parameter Default: 0 seconds
    open var transitionDelay: TimeInterval = 0
    
    /// Animation Curve
    /// - parameter Default: CurveLinear
    open var animationOption: UIViewAnimationOptions = .curveLinear
    
    var direction: JDAnimationSlideFrom.Direction {
        return .right
    }
    
    open override func perform() {
        let sourceVC = source
        let destinationVC = destination
        
        setupScreens()
        
        destinationVC.view.center = destinationCenter
        
        delay() {
            sourceVC.view.window!.addSubview(destinationVC.view)
            
            UIView.animate(withDuration: self.transitionTime, delay: 0, options: self.animationOption, animations: {

                destinationVC.view.center = self.source.view.center
                sourceVC.view.center = self.sourceCenter
                
            }) { finished in
                
                self.finishSegue(nil)
            }
        }
    }
    
    
    var sourceCenter: CGPoint {
        let center = source.view.center
        let frame = source.view.frame
        
        switch direction {
        case .left: return CGPoint(x: center.x + frame.width, y: center.y)
        case .right: return CGPoint(x: center.x - frame.width, y: center.y)
        case .bottom: return CGPoint(x: center.x, y: center.y - frame.height)
        case .top: return CGPoint(x: center.x, y: center.y + frame.height)
        }
    }
    
    var destinationCenter: CGPoint {
        let center = source.view.center
        let frame = source.view.frame
        
        switch direction {
        case .left: return CGPoint(x: center.x - frame.width, y: center.y)
        case .right: return CGPoint(x: center.x + frame.width, y: center.y)
        case .bottom: return CGPoint(x: center.x, y: center.y + frame.height)
        case .top: return CGPoint(x: center.x, y: center.y - frame.height)
        }
    }
}
