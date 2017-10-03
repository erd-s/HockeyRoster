//
//  Constants.swift
//  HockeyRoster
//
//  Created by Christopher Erdos on 10/2/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation

struct CellIdentifiers {
	static let roster = "rosterCellIdentifier"
}

struct SegueIdentifiers {
	static let playerDetailSegue = "playerDetailSegue"
}

struct Links {
	static let rosterJSON = URL(string: "https://www.downloadablehockeyfoo.com/rosterbar.json")
	static var localJSONFilepath: URL? {
		if let path = Bundle.main.path(forResource: "generated", ofType: "json") {
			return URL(fileURLWithPath: path)
		} else {
			return nil
		}
	}
}
