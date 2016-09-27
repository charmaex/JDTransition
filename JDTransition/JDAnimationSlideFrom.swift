//
//  JDAnimationSlideFrom.swift
//  JDTransition
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

struct JDAnimationSlideFrom {

    static func left(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .left, completion: completion)
    }

    static func right(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .right, completion: completion)
    }
    
    static func bottom(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .bottom, completion: completion)
    }
    
    static func top(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options: UIViewAnimationOptions?, completion: @escaping (Bool) -> ()) {
        animate(fromVC: fromVC, toVC: toVC, duration: duration, options: options, direction: .top, completion: completion)
    }
    
    enum Direction {
        case left
        case right
        case bottom
        case top
    }
    
    private static func animate(fromVC: UIViewController, toVC: UIViewController, duration: TimeInterval, options opt: UIViewAnimationOptions?, direction: Direction, completion: @escaping (Bool) -> ()) {

        let options = opt ?? .curveLinear
        let centerToVC = originToVC(fromVC: fromVC, direction: direction)
        let centerFromVC = destinationFromVC(fromVC: fromVC, direction: direction)

        toVC.view.frame = fromVC.view.frame
        toVC.view.center = centerToVC
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            
            toVC.view.center = fromVC.view.center
            fromVC.view.center = centerFromVC

        }) { finished in
            completion(finished)
        }
    }

    private static func destinationFromVC(fromVC: UIViewController, direction: Direction) -> CGPoint {

        let center = fromVC.view.center
        let frame = fromVC.view.frame
        
        switch direction {
        case .left: return CGPoint(x: center.x + frame.width, y: center.y)
        case .right: return CGPoint(x: center.x - frame.width, y: center.y)
        case .bottom: return CGPoint(x: center.x, y: center.y - frame.height)
        case .top: return CGPoint(x: center.x, y: center.y + frame.height)
        }
    }

    private static func originToVC(fromVC: UIViewController, direction: Direction) -> CGPoint {

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
