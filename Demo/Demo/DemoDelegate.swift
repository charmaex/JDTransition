//
//  File.swift
//  Demo
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import JDTransition

class DemoDelegate: JDNavigationDelegate {
    
    private let animator = JDAnimator()
    
    override func pushAnimator() -> JDAnimator? {
        animator.reset()
        
        animator.animationType(setTo: .slideFromBottom)
        return animator
    }
    
    override func popAnimator() -> JDAnimator? {
        animator.reset()
        
        animator.animationType(setTo: .slideFromTop)
        animator.transitionDuration(setTo: 2)
        animator.transitionOptions(setTo: .curveEaseInOut)
        
        return animator
    }
    
}

