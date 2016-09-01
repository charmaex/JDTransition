//
//  ViewController.swift
//  Demo
//
//  Created by Jan Dammshäuser on 29.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit
import JDTransition

class ViewController: UIViewController {

    @IBAction func upperBtn(sender: UIButton) {
        performSegueWithIdentifier(Segues.ScaleIn.rawValue, sender: sender)
    }

    @IBAction func lowerBtn(sender: UIButton) {
        let nextVC = SecondViewController()
        
        let segue = JDSegueScaleIn(identifier: nil, source: self, destination: nextVC)
        
        segue.animationOrigin = sender.center
        segue.transitionDelay = 1
        segue.transitionTime = 2
        
        segue.perform()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segue = segue as? JDSegueScaleIn, let sender = sender as? UIView {
            segue.animationOrigin = sender.center
        }
    }
    
}

