//
//  RosterLoader.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation

class RosterLoader: NSObject {
	var task: URLSessionDataTask?
	
	/**
	Loads a roster based on url provided.
	- parameter urlToLoad: The url of the hockey team to load.
	- parameter complete: Completes with an array of players if the load is successful or an error if it is not.
	*/
	func loadFrom(url urlToLoad: URL?, withCompletion complete: @escaping (([Player]?, Error?) -> ())) {
		guard let rosterLink = urlToLoad else { complete(nil, nil); return }
		task?.cancel()
		
		task = URLSession.shared.dataTask(with: rosterLink) { (data, response, error) in
			if let data = data {
				do {
					let rosterJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
					
					complete(self.parsedRoster(rosterJSON), nil)
				} catch (let error) {
					complete(nil, error)
				}
			} else if let error = error {
				complete(nil, error)
			}
		}
		
		task?.resume()
	}
	
	///Parses an array of dictionaries into an array of constructed players.
	private func parsedRoster(_ playerDicts: [[String: Any]]?) -> [Player]? {
		guard let playerDicts = playerDicts else { return nil }
		
		var players = [Player]()
		for playerDict in playerDicts {
			let player = Player(fromDict: playerDict)
			players.append(player)
		}
		
		return players
	}
}
