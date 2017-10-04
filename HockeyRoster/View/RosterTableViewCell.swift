//
//  RosterTableViewCell.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import UIKit

class RosterTableViewCell: UITableViewCell {
	@IBOutlet weak var playerImageView: UIImageView!
	@IBOutlet weak var playerNameLabel: UILabel!
	@IBOutlet weak var playerPositionLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		selectedBackgroundView = UIImageView(image: UIColor.gray05.image)
	}
}
