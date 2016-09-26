//
//  JDAnimationSlideFrom.swift
//  JDTransition
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class JDAnimationSlideFrom {

    class func left(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .left, completion: completion)
    }

    class func right(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .right, completion: completion)
    }
    
    class func bottom(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .bottom, completion: completion)
    }
    
    class func top(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .top, completion: completion)
    }
    
    enum Direction {
        case left
        case right
        case bottom
        case top
    }
    
    private class func animate(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options opt: UIViewAnimationOptions?, direction: Direction, completion: @escaping (Bool) -> ()) {

        let options = opt ?? .curveLinear

        toVC.view.frame = fromVC.view.frame
        toVC.view.center = JDAnimationSlideFrom.destinationCenter(fromVC: fromVC, direction: direction)
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            
            toVC.view.center = fromVC.view.center
            fromVC.view.center = JDAnimationSlideFrom.sourceCenter(fromVC: fromVC, direction: direction)

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
