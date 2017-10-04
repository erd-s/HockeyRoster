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
	func loadFrom(url urlToLoad: URL?, withCompletion complete: @escaping ((Roster?, Error?) -> ())) {
		guard let rosterLink = urlToLoad else { complete(nil, nil); return }
		task?.cancel()
		
		task = URLSession.shared.dataTask(with: rosterLink) { (data, response, error) in
			if let data = data {
				complete(self.parseRoster(from: data), nil)
			} else if let error = error {
				complete(nil, error)
			}
		}
		
		task?.resume()
	}
	
	private func parseRoster(from data: Data) -> Roster? {
		let decoder = JSONDecoder()
		do {
			return try decoder.decode(Roster.self, from: data)
		} catch (let error) {
			print("error decoding roster from data", error)
			return nil
		}
	}
}
