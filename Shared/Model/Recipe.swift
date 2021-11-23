//
//  Recipe.swift
//  cooKids
//
//  Created on 17/11/2021.
//

import Foundation

struct Recipe: Identifiable, Comparable {
	static func < (first: Recipe, second: Recipe) -> Bool {
		if first.requiredTrophyProgress != second.requiredTrophyProgress {
			return first.requiredTrophyProgress < second.requiredTrophyProgress
		} else {
			return first.title < second.title
		}
	}
	
	static func == (first: Recipe, second: Recipe) -> Bool {
		first.id == second.id
	}
	
	var id: String { title }
	let title: String
	var ingredients: [Ingredient]
	let steps: [Step]
	let imageName: String
	let category: Category
	let trophies: [Trophy]
	let requiredTrophyProgress: Int
	
	struct Ingredient {
		internal init(name: String, icon: String = "🔸") {
			self.name = name
			self.icon = icon
		}
		
		let name: String
		let icon: String
	}
	
	struct Step: Identifiable {
		internal init(title: String, body: String, imageName: String? = nil) {
			self.title = title
			self.body = body
			self.imageName = imageName
		}
		
		var id: String { title }
		let title: String
		let body: String
		let imageName: String?
	}
	
	enum Category: String, CaseIterable, Identifiable {
		var id: String { rawValue }
		var title: String { rawValue }
		
		case sweets = "Sweets"
		case appetizers = "Appetizers"
		case mainCourse = "Main Course"
		case firstCourse = "First Course"
		
	}
}
