//
//  JDSlideFromXAnimation.swift
//  JDTransition
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class JDAnimationSlideFrom {
    
    class func left(fromVC: UIViewController, toVC: UIViewController, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, direction: .left, completion: completion)
    }
    
    private static var transitionTime: TimeInterval = 0.5
    
    enum Direction {
        case left
        case right
        case bottom
        case top
    }
    
    private class func animate(fromVC: UIViewController, toVC: UIViewController, direction: Direction, completion: @escaping (Bool) -> ()) {
        
//        toVC.view.frame = fromVC.view.frame
        toVC.view.center = destinationCenter(fromVC: fromVC, direction: direction)
        
//        fromVC.view.window!.addSubview(toVC.view)
        
        UIView.animate(withDuration: transitionTime, delay: 0, options: .curveLinear, animations: {
            
            toVC.view.center = fromVC.view.center
            fromVC.view.center = self.sourceCenter(fromVC: fromVC, direction: direction)
            
        }) { finished in
            
            completion(finished)
        }
    }
    
    
    private class func sourceCenter(fromVC: UIViewController, direction: Direction) -> CGPoint {
        let center = fromVC.view.center
        let frame = fromVC.view.frame
        
        switch direction {
        case .left: return CGPoint(x: center.x + frame.width, y: center.y)
        case .right: return CGPoint(x: center.x - frame.width, y: center.y)
        case .bottom: return CGPoint(x: center.x, y: center.y - frame.height)
        case .top: return CGPoint(x: center.x, y: center.y + frame.height)
        }
    }
    
    private class func destinationCenter(fromVC: UIViewController, direction: Direction) -> CGPoint {
        let center = fromVC.view.center
        let frame = fromVC.view.frame
        
        switch direction {
        case .left: return CGPoint(x: center.x - frame.width, y: center.y)
        case .right: return CGPoint(x: center.x + frame.width, y: center.y)
        case .bottom: return CGPoint(x: center.x, y: center.y + frame.height)
        case .top: return CGPoint(x: center.x, y: center.y - frame.height)
        }
    }
    
}
