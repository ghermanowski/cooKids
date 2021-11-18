//
//  Recipe.swift
//  cooKids
//
//  Created on 17/11/2021.
//

import Foundation

struct Recipe: Identifiable, RapresentableInRectProtocol {
	var id: String { title }
	let title: String
	let ingredients: [Ingredient]
	let steps: [Step]
	let imageName: String
	let category: Category
	let trophies: [Trophy]
	var isUnlocked = false
	
	struct Ingredient {
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
		
		case sweets = "Sweets"
		case mainCourse = "Main Course"
	}
}
