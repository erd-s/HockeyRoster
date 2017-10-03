//
//  UIViewController + Extension.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	
	/**
	Alert to show when an error occurs.
	
	- parameter title: The title to display. Default is nil.
	- parameter message: The message to display. Default is nil.
	- parameter completion: The action to perform when the user presses OK.
	*/
	func showErrorAlertWith(title: String? = nil, message: String? = nil, completion: (()->())? = nil) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
			completion?()
		}
		
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}
}
