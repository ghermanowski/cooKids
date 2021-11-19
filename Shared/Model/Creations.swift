//
//  Creations.swift
//  cooKids
//
//  Created by Anna Izzo on 19/11/21.
//

import Foundation

struct Creation: Identifiable, RapresentableInRectProtocol {
	var id: String { imageName }
	var title: String = ""
	let recipeTitle: RecipeTitle
	var date: Date
	let imageName: String
	let trophies: [Trophy] = []
	
	enum DateorRecipe {
		case dateTitle
		case recipeTitle
	}
	enum RecipeTitle: String, CaseIterable, Identifiable {
		var id: String { rawValue }
		
		case berryQuark = "Berry Quark"
		case caprese = "Caprese"
		case muffins = "Muffins"
		case nutellaCrepes = "Nutella Crêpes"
	}
	
	mutating func changeTitle (titleFor: DateorRecipe) -> Creation {
		if titleFor == .recipeTitle {
			self.title = self.recipeTitle.rawValue
		} else {
			self.title = self.date.formatted(date: .abbreviated, time: .omitted)
		}
		return self
	}
}
