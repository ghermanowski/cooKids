//
//  UserStore.swift
//  cooKids
//
//  Created on 17/11/2021.
//

import Foundation

class UserStore: ObservableObject {
	init() {
		trophies = [.cleaning: .init(title: "Cleaning", count: .random(in: 0...9), maximum: 9),
					.baking: .init(title: "Baking", count: .random(in: 0...8), maximum: 8)]
	}
	
	@Published var trophies: [Trophy: Trophy.Details]
	
	let recipes = [Recipe(title: "Berry Quark",
						  ingredients: [.init(name: "250 gramms Quark", icon: "🥛", isChecked: false),
										.init(name: "200 gramms Greek Yoghurt", icon: "🥛", isChecked: false),
										.init(name: "250 gramms Berries", icon: "🍓", isChecked: false),
										.init(name: "2 tablespoons Honey", icon: "🍯", isChecked: false)],
						  steps: [.init(title: "Preparation",
										body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
								  .init(title: "Take Berries",
										body: "If you have frozen berries let them stand at room temperature for 15 minutes."),
								  .init(title: "Mix Yogurt and Quark",
										body: "Put the Greek yogurt and the quark in your mixing bowl and start to mix with a spoon.")],
						  imageName: "berryQuarkImage",
						  category: .sweets,
						  trophies: [.cleaning])]
}
