//
//  PlayerImageLoader.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation
import UIKit

class PlayerImageLoader {
	///loads image for a user, completes with bool for success or failure
	static func loadImageFor(_ player: Player, withCompletion complete: @escaping ((Bool)->())) {
		guard
			let imageURL = player.imageURL,
			!player.isLoadingImage
			else {
				complete(false)
				return
		}
		
		player.isLoadingImage = true
		
		let session = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
			if let imageData = data {
				player.image = UIImage(data: imageData)
				complete(true)
			} else {
				complete(false)
			}
		}
		
		session.resume()
	}
}
