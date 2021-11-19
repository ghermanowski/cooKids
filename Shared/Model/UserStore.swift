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
					.baking: .init(title: "Baking", count: .random(in: 0...8), maximum: 8),
					.sweets: .init(title: "Sweets", count: .random(in: 0...9), maximum: 9),
					.heat: .init(title: "Heat", count: .random(in: 0...9), maximum: 9)]
		
		for any in self.creations {
			var new = any
			self.creationsRecipe.append(new.changeTitle(titleFor: .recipeTitle))
			self.creationsPhotos.append(new.changeTitle(titleFor: .dateTitle))
		}
	}
	
	@Published var trophies: [Trophy: Trophy.Details]
	
	@Published var creationsRecipe: [Creation] = []
	@Published var creationsPhotos: [Creation] = []
	
	var creations: [Creation] = [ Creation(recipeTitle: .nutellaCrepes, date: Date.now, imageName: "crepes1"),
							  Creation(recipeTitle: .nutellaCrepes, date: Date.now, imageName: "crepes2"),
							  Creation(recipeTitle: .nutellaCrepes, date: Date.now, imageName: "crepes3"),
							  Creation(recipeTitle: .berryQuark, date: Date.now, imageName: "berryQuarkImage"),
							  Creation(recipeTitle: .muffins, date: Date.now, imageName: "muffins")]
	
	var recipes = [Recipe(title: "Berry Quark",
						  ingredients: [.init(name: "250 gramms Quark", icon: "🥛"),
										.init(name: "200 gramms Greek Yoghurt", icon: "🥛"),
										.init(name: "250 gramms Berries", icon: "🍓"),
										.init(name: "2 tablespoons Honey", icon: "🍯")],
						  steps: [.init(title: "Preparation",
										body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
								  .init(title: "Take Berries",
										body: "If you have frozen berries let them stand at room temperature for 15 minutes."),
								  .init(title: "Mix Yogurt and Quark",
										body: "Put the Greek yogurt and the quark in your mixing bowl and start to mix with a spoon."),
								  .init(title: "Add berries and honey",
										body: "Add the berries and 2 tablespoon of hony."),
								  .init(title: "Serve and decorate",
										body: "Put your portion in a small bowl and put the rest in the fridge. Decorate with more honey and some cereals on the surface."),
								  .init(title: "Clean up",
										body: "Clean up your cooking station and wash your hands."),
								  .init(title: "Good job!",
										body: "Take a picture of your creation!")],
						  imageName: "berryQuarkImage",
						  category: .sweets,
						  trophies: [.cleaning]),
				   
				   Recipe(title: "Apple cranberry muffins",
						  ingredients: [.init(name: "375 gramms wholemeal flour", icon: "🌾"),
										.init(name: "25 gramms ground flax", icon: "🌱"),
										.init(name: "5 gramms baking powder", icon: ""),
										.init(name: "2 gramms cinnamon", icon: ""),
										.init(name: "250 mL unsweetened applesauce", icon: "🍏"),
										.init(name: "75 gramms brown sugar", icon: ""),
										.init(name: "25 mL canola oil", icon: ""),
										.init(name: "1 egg", icon: "🥚"),
										.init(name: "1 tsp (5 mL) vanilla", icon: ""),
										.init(name: "125 gramms dried cranberries", icon: "🫐")],
								steps: [.init(title: "Preparation",
											body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
										.init(title: "Whisk",
											body: "In a large bowl, whisk together flour, flax, baking powder, cinnamon and set aside."),
										.init(title: "Mix",
											body: "In another bowl, whisk together applesauce, sugar, oil, egg and vanilla. Pour over flour mixture and stir until just combined. Stir in cranberries."),
										.init(title: "Let's put them to cook!",
											body: "Divide batter among 12 greased or paper lined muffin tins. Bake in 400° F (200° C) oven for about 12 minutes or until golden and firm when touched.")],
										 imageName: "muffins",
										 category: .sweets,
										 trophies: [.cleaning]),
	
				   Recipe(title: "Tomato Spaghetti",
						  ingredients: [.init(name: "320 g spaghetti", icon: "🍝"),
										.init(name: "800 g peeled tomatoes", icon: "🍅"),
										.init(name: "30 g Extra virgin olive oil", icon: ""),
										.init(name: "1 clave garlic", icon: "🍅"),
										.init(name: "Basil", icon: "🌿"),
										.init(name: "Salt", icon: "🧂")],
								steps: [.init(title: "Preparation",
											body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
										.init(title: "Start",
											body: "Start by preparing the sauce. Pour the extra virgin olive oil in a pan with the peeled and halved garlic clove so you can remove the core and make the scent more delicate. Cook for 2 minutes over high heat, add the peeled tomatoes and salt."),
										.init(title: "Mix",
											body: "Cover with a lid and cook for at least 1 hour over very low heat: the sauce should simmer gently. Mix it from time to time. After this time, remove the garlic and pass the tomatoes through a sieve to obtain a smooth and homogeneous puree."),
										.init(title: "We are almost there...",
											body: "Pour the sauce back into the pan, turn the heat to very low and add the basil leaves. After a few minutes, turn off the sauce and keep it warm. All you have to do now is cook the pasta in plenty of boiling salted water."),
										.init(title: "We are almost there...",
											body: "Drain the spaghetti al dente directly into the sauce and stir for a few moments over high heat to mix everything together. Your spaghetti with tomato sauce is ready, all you have to do is serve it, garnished with fresh basil to taste!")],
										 imageName: "spaghetti",
										 category: .mainCourse,
										 trophies: [.cleaning])]
}
