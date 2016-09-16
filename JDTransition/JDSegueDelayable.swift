//
//  JDSegueDelayable.swift
//  JDSegues
//
//  Created by Jan Dammshäuser on 29.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Blueprint for JDSegues which can be delayed
@objc
public protocol JDSegueDelayable: JDSegue {
    /// Time the transition animation is delayed after calling
    /// - parameter Default: 0 seconds
    var transitionDelay: TimeInterval { get set }
}


public extension JDSegueDelayable {
    
    public func delay(_ delayedCode: @escaping () -> ()) {
        
        let delayTime: DispatchTime = DispatchTime.now() + Double(Int64(transitionDelay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            delayedCode()
        })
    }
    
}
