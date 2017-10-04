//
//  Player.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation
import UIKit

class Player: Codable {
	var image: UIImage?
	var imageURL: URL?
	var name: String?
	var position: String?
	var isLoadingImage = false
	
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		
		imageURL = try values.decode(URL.self, forKey: .imageURL)
		name = try values.decode(String.self, forKey: .name)
		position = try values.decode(String.self, forKey: .position)
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(imageURL, forKey: .imageURL)
		try container.encode(position, forKey: .position)
		try container.encode(name, forKey: .name)
	}
}

extension Player {
	private enum CodingKeys: String, CodingKey {
		case imageURL = "picture"
		case name
		case position
	}
}
