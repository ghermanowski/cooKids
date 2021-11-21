//
//  Creations.swift
//  cooKids
//
//  Created by Anna Izzo on 19/11/21.
//

import Foundation
import UIKit

struct Creation: Identifiable, RapresentableInRectProtocol {
	var id: String { imageName }
	var title: String = ""
	let recipeTitle: RecipeTitle
	var date: Date
	var imageName: String
	let trophies: [Trophy] = []
	var photo: UIImage?
	
	enum DateorRecipe {
		case dateTitle
		case recipeTitle
	}
	enum RecipeTitle: String, CaseIterable, Identifiable {
		var id: String { rawValue }
		
		case berryQuark = "Berry Quark"
		case caprese = "Caprese"
		case muffins = "Apple cranberry muffins"
		case nutellaCrepes = "Nutella Crêpes"
		case polenta = "Polenta medallons"
		case parmigiana = "Eggplant parmigiana"
		case carbonara = "Spaghetti Carbonara"
		case spaghetti = "Tomato Spaghetti"
		case mozzarella = "Fried Mozzarella"
		case bruschetta = "Tomato Bruschetta"
	}
	
	init(recipeTitle: Creation.RecipeTitle, date: Date, imageName: String?, photo: UIImage? = nil) {
		if let image = photo {
			self.photo = image
		}
		self.imageName = imageName ?? "\(recipeTitle.rawValue)-\(date.formatted(date: .numeric, time: .standard))"
		self.recipeTitle = recipeTitle
		self.date = date
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
