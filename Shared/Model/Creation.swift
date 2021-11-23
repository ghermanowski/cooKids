//
//  Creations.swift
//  cooKids
//
//  Created by Anna Izzo on 19/11/21.
//

import Foundation
import UIKit

struct Creation: Identifiable {
	var id: String { imageName }
	var title: String = ""
	let recipeTitle: RecipeTitle
	var date: Date
	var imageName: String
	var photo: UIImage?
	
	enum DateorRecipe {
		case dateTitle
		case recipeTitle
	}
	enum RecipeTitle: String, CaseIterable, Identifiable {
		var id: String { rawValue }
		
		case fishEggs = "Fish Eggs"
		case smilingPizzas = "Smiling Pizzas"
		case sillySandwich = "Silly Sandwich"
		case frogSandwiches = "Frog Sandwiches"
		case puffs = "Choux Puffs"
		case monsterCookie = "Monster Cookie"
		case owlCookies = "Owl Cookies"
		case berryQuark = "Berry Quark"
		case unicornPancakes = "Unicorn Pancakes"
		case muffins = "Apple cranberry muffins"
		case nutellaCrepes = "Nutella Crêpes"
		case eggBunny = "Egg Bunny"
		case vegPizza = "Vegetables Pizzas"
		case spagMeatball = "Spaghetti Meatball"
		case bunnyBread = "Bunny Bread"
		case polenta = "Polenta Medallons"
		case parmigiana = "Eggplant Parmigiana"
		case carbonara = "Spaghetti Carbonara"
		case spaghetti = "Tomato Spaghetti"
		case mozzarella = "Fried Mozzarella"
		case bruschetta = "Tomato Bruschetta"
		case unknown = "Unknown"
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
