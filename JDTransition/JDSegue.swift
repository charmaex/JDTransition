//
//  JDSegue.swift
//  JDSegues
//
//  Created by Jan Dammshäuser on 29.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Blueprint for JDSegues
@objc
public protocol JDSegue {
    
    /// Animation Curve
    /// - parameter Default: x
    var animationOption: UIViewAnimationOptions { get set }
    
    /// Time the transition animation takes
    /// - parameter Default: x seconds
    var transitionTime: TimeInterval { get set }
}

extension JDSegue where Self: UIStoryboardSegue {
    
    func setupScreens() {
        destination.view.frame = source.view.frame
    }
    
    func finishSegue(_ completion: (() -> Void)?) {
        source.present(destination, animated: false, completion: completion)
    }
}
