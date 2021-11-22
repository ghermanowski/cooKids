//
//  Trophy.swift
//  cooKids
//
//  Created on 17/11/2021.
//

import Foundation

enum Trophy: String, Identifiable {
	var id: String { rawValue }
	var title: String { rawValue }
	
	case cleaning = "Cleaning"
	case baking = "Baking"
	case sweets = "Sweets"
	case heat = "Heat"
	case cutting = "Cutting"
	
	struct Details {
		internal init(icon: String, count: Int, maximum: Int) {
			self.icon = icon
			self.count = count
			self.maximum = maximum
		}
		
		let icon: String
		var count: Int
		let maximum: Int
		
		var progress: Double {
			Double(count) / Double(maximum)
		}
	}
}
