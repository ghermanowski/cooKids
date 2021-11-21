//
//  Trophy.swift
//  cooKids
//
//  Created on 17/11/2021.
//

import Foundation

enum Trophy: String, Identifiable {
	var id: String { rawValue }
	var icon: String { rawValue }
	
	case cleaning = "🧼"
	case baking = "🍰"
	case sweets = "🍩"
	case heat = "🔥"
	case cutting = "🔪"
	
	struct Details {
		internal init(title: String, count: Int, maximum: Int) {
			self.title = title
			self.count = count
			self.maximum = maximum
		}
		
		let title: String
		var count: Int
		let maximum: Int
		
		var progress: Double {
			Double(count) / Double(maximum)
		}
	}
}
