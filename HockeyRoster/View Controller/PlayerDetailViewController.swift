//
//  PlayerDetailViewController.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {
		// MARK: - Properties
		var player: Player?

		// MARK: - Outlets
		@IBOutlet weak var playerImageView: UIImageView!
	@IBOutlet weak var playerNameLabel: UILabel!
	@IBOutlet weak var playerPositionLabel: UILabel!
	
		// MARK: - View
	    override func viewDidLoad() {
        super.viewDidLoad()
	
		fillUserInformation()
	}
	
		// MARK: - Player information loading
		func fillUserInformation() {
		playerImageView.image = player?.image
		playerNameLabel.text = player?.name
		playerPositionLabel.text = player?.position
	}
}
