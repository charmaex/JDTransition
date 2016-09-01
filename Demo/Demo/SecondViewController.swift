//
//  SecondViewController.swift
//  Demo
//
//  Created by Jan Dammshäuser on 29.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    init() {
        super.init(nibName: "SecondViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func dismiss(sender: UIButton) {
        dismissViewControllerAnimated(false, completion: nil)
    }
}
