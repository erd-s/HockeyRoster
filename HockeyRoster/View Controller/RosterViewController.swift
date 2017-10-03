//
//  RosterViewController.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import UIKit

class RosterViewController: UIViewController {
	//--------------------------------------
	// MARK: - Properties
	//--------------------------------------
	var players: [Player]?
	var rosterLoader: RosterLoader?
	var selectedPlayer: Player?
	
	//--------------------------------------
	// MARK: - Outlets
	//--------------------------------------
	@IBOutlet weak var rosterTableView: RosterTableView!
	@IBOutlet weak var rosterNotAvailableLabel: UILabel!
	
	//--------------------------------------
	// MARK: - View
	//--------------------------------------
	override func viewDidLoad() {
		super.viewDidLoad()
		
		rosterLoader = RosterLoader()
		rosterLoader?.loadFrom(url: Links.localJSONFilepath) {  [weak self] (players, error) in
			if let error = error {
				let nsVersionError = error as NSError
				let message = "Error code: \(nsVersionError.code). " + "\(error.localizedDescription)"
				
				self?.showErrorAlertWith(title: "Error loading roster.", message: message)
				return
			}
			
			self?.players = players
			self?.configureViewsForRoster()
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		//resets tableview for selection of another player
		if let selectedRowIndexPath = rosterTableView.indexPathForSelectedRow {
			selectedPlayer = nil
			rosterTableView.deselectRow(at: selectedRowIndexPath, animated: true)
		}
	}
	
	///reloads tableview or shows roster not available text.
	func configureViewsForRoster() {
		DispatchQueue.main.async { [weak self] in
			if (self?.players?.count ?? 0) > 0 {
				self?.rosterTableView.reloadData()
				self?.rosterNotAvailableLabel.alpha = 0
			} else {
				UIView.animate(withDuration: 0.3, animations: {
					self?.rosterNotAvailableLabel.alpha = 1
				})
			}
		}
	}
	
	//--------------------------------------
	// MARK: - Segue
	//--------------------------------------
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let dvc = segue.destination as? PlayerDetailViewController {
			dvc.player = selectedPlayer
		}
	}
}


//--------------------------------------
// MARK: - Table View
//--------------------------------------
extension RosterViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.roster) as? RosterTableViewCell {
			let player = players?[indexPath.row]
			cell.playerNameLabel.text = player?.name
			cell.playerPositionLabel.text = player?.position
			if let playerImage = player?.image {
				cell.playerImageView.image = playerImage
			} else {
				cell.playerImageView.image = UIColor.gray05.image
			}
			
			return cell
		} else {
			return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let players = players {
			return players.count
		} else {
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard let player = players?[indexPath.row], player.image == nil, !player.isLoadingImage else { return }
		
		PlayerImageLoader.loadImageFor(player) { success in
			if success {
				DispatchQueue.main.async {
					tableView.reloadData()
				}
			}
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let player = players?[indexPath.row] else { return }
		
		selectedPlayer = player
		performSegue(withIdentifier: SegueIdentifiers.playerDetailSegue, sender: self)
	}
}