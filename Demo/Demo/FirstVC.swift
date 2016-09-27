//
//  FirstVC.swift
//  Demo
//
//  Created by Jan Dammshäuser on 26.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit
import JDTransition

class FirstVC: UIViewController {

	@IBAction func pushVC(sender: UIButton) {
		let VC = SecondViewController()
		navigationController?.pushViewController(VC, animated: true)
	}
}
