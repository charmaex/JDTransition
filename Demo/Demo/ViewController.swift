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

	@IBAction func upperBtn(_ sender: UIButton) {
		performSegue(withIdentifier: Segues.ScaleIn.rawValue, sender: sender)
	}

	@IBAction func lowerBtn(_ sender: UIButton) {
		let nextVC = SecondViewController()

		let segue = JDSegueScaleOut(identifier: nil, source: self, destination: nextVC)

		segue.animationOrigin = sender.center
		segue.transitionTime = 2

		segue.perform()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let segue = segue as? JDSegueScaleIn, let sender = sender as? UIView {
			segue.animationOrigin = sender.center
		}
	}
}
