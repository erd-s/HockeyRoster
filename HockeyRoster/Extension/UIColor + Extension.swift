//
//  UIColor + Extension.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	var image: UIImage? {
		let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
		UIGraphicsBeginImageContext(rect.size)
		
		let context = UIGraphicsGetCurrentContext()
		context?.setFillColor(cgColor)
		context?.fill(rect)
		
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return image
	}
	
	static var gray05: UIColor { return UIColor(white: 0, alpha: 0.05) }
}
