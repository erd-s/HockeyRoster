//
//  Player.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation
import UIKit

class Player {
	var image: UIImage?
	var imageURL: URL?
	var name: String?
	var position: String?
	var isLoadingImage = false
	init(fromDict dict: [String: Any]?) {
		guard let dict = dict else { return }
		name = dict[Keys.name] as? String
		
		///position (coordinates) is based on available randomly generated data
		if let yPos = dict[Keys.yPos] as? Double,
			let xPos = dict[Keys.xPos] as? Double {
			position = "(\(xPos), \(yPos))"
		} else {
			///position based on server hosted json
			position = dict[Keys.position] as? String
		}
		
		if let imageURLString = dict[Keys.imageURL] as? String {
			imageURL = URL(string: imageURLString)
		}
	}
}

//--------------------------------------
// MARK: - JSON Keys
//--------------------------------------
extension Player {
	private struct Keys {
		static let name = "name"
		static let xPos = "latitude"
		static let yPos = "longitude"
		static let imageURL = "picture"
		static let position = "position"
		
		//TODO: Correct/add keys based on actual hockey roster JSON when it becomes available.
	}
}
