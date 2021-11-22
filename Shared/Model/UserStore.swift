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
					.heat: .init(title: "Heat", count: .random(in: 0...9), maximum: 9),
					.cutting: .init(title: "Cutting", count: .random(in: 0...8), maximum: 8)]
		
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
	
	var recipes = [
		
		//		Sweets
		
		Recipe(title: "Berry Quark",
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
			   trophies: [.cleaning, .sweets]),
				
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
								   trophies: [.cleaning, .sweets]),
	
				
		
//		Appetizers
		
		Recipe(title: "Tomato Bruschetta",
			   ingredients: [.init(name: "8 slices Homemade bread", icon: "🥖"),
							 .init(name: "500 g Cluster tomatoes", icon: "🍅"),
							 .init(name: "8 leaves Basil", icon: "🌱"),
							 .init(name: "Oregano", icon: "🌿"),
							 .init(name: "Extra virgin olive oil", icon: "🫒"),
							 .init(name: "Fine salt", icon: "🧂"),
							 .init(name: "Black pepper", icon: "")],
					 steps: [.init(title: "Preparation",
								 body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
							 .init(title: "Tomatoes",
								 body: "First wash the tomatoes, divide them in half and then cut them into cubes. Pour the cut tomatoes into a bowl and add basil leaves, previously washed and dried."),
							 .init(title: "Blend flavors",
								 body: "Season with a pinch of oregano, salt, pepper and oil. Stir well and let the flavors blend for some minutes."),
							 .init(title: "We are almost there!",
								 body: "Now top the bread slices with your tomato salad, drizzling a little more oil. Let rest for a couple of minutes, then serve your tomato bruschettas!")],
							  imageName: "bruschette",
							  category: .appetizers,
			   trophies: [.cleaning, .heat]),
		
		Recipe(title: "Fried Mozzarella",
			   ingredients: [.init(name: "12 slices White bread loaf", icon: "🥖"),
							 .init(name: "500 g Mozzarella di bufala cheese", icon: ""),
							 .init(name: "5 Eggs", icon: "🥚"),
							 .init(name: "100 g Flour 00", icon: ""),
							 .init(name: "300 g Breadcrumbs", icon: ""),
							 .init(name: "Fine salt", icon: "🧂")],
					 steps: [.init(title: "Preparation",
								 body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
							 .init(title: "Cut mozzarella",
								 body: "Start by cutting the buffalo mozzarella into 1 cm thick slices. Place them gradually on a tray lined with blotting paper and cover with more blotting paper. "),
							 .init(title: "Stuff the bread",
								 body: "Press gently with your hands to blot the mozzarella and remove excess water. If necessary, use paper towels until it is completely dry. At this point, go ahead and stuff the bread. Put the slices of bread on a cutting board."),
							 .init(title: "Bread on bread",
								 body: "Place the slices of mozzarella on top, so as to cover the entire surface, but without letting it stick out, salt and cover each slice with another slice of bread."),
							 .init(title: "Slices",
								 body: "Press gently with your hands to pack it all together. Continue like this for all the other slices of bread, until you finish the mozzarella. Then trim the slices of stuffed bread using a knife, to remove the outer crust. At this point you can cut the mozzarella in the bread in two different ways. By cutting a cross you will get 4 squares from each slice."),
							 .init(title: "Break eggs",
								 body: "For a triangular cut you have to cut the bread first in half on the diagonal and then in half on the other diagonal. This way you will get 4 triangles. Continue this way until all the pieces are finished. Now switch to the breading. Break the eggs into an oven dish and beat them with a whisk for a few minutes."),
							 .init(title: "Coat stuffed bread",
								 body: "Then in two other baking dishes place the breadcrumbs in one and the sifted flour in the other. At this point dip each piece of stuffed bread first into the flour and then using 2 forks into the egg, to coat them completely. Then set them on a plate for a few seconds, to remove the excess egg part."),
							 .init(title: "Dip it in the breadcrumbs",
								 body: "Avoid lumps when you dip it in the breadcrumbs.Transfer to a cutting board and with the blade of a knife lightly press the edges and the surface in order to even out the breadcrumbs and make a more precise shape. If necessary, dip it in the breadcrumbs again and press again with the knife blade. Continue in this way for all the other pieces and transfer them gradually to a tray lined with baking paper. Then place in the fridge for about 30 minutes."),
							 .init(title: "Dip into the egg",
								 body: "After the breaded mozzarella has set , you can start with the second breading, first dip into the egg, then set in the saucer to remove the excess and finally dip in the breadcrumbs. "),
							 .init(title: "Let's cook!",
								 body: "As previously, then transfer the pieces of breaded mozzarella onto a cutting board and with the blade of a knife even out the breadcrumbs. Continue this way for all the others by placing them on a tray lined with baking paper. Store in the fridge to set for another 30 minutes. Pour the oil into a frying pan and bring it to a temperature of 340-350° F (170-180° C) maximum. Put in a few pieces at a time and cook the fried mozzarellas for 1-2 minutes, turning them from time to time with a skimmer."),
							 .init(title: "Stuff the bread",
								 body: "When they are well browned, drain them from the oil and put them on a tray lined with absorbent paper to remove the excess oil. Fry the others and serve. "),
							 .init(title: "Enjoy your fried mozzarella!",
								 body: "Press gently with your hands to blot the mozzarella and remove excess water. If necessary, use paper towels until it is completely dry. At this point, go ahead and stuff the bread. Put the slices of bread on a cutting board.")],
							  imageName: "mozzarellaincarrozza",
							  category: .appetizers,
			   trophies: [.cleaning, .heat, .baking]),
		
//		First courses
	
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
							  category: .firstCourse,
							  trophies: [.cleaning]),
		
		Recipe(title: "Spaghetti Carbonara",
			   ingredients: [.init(name: "320 g spaghetti", icon: "🍝"),
							 .init(name: "150 g guanciale", icon: "🥓"),
							 .init(name: "6 Egg yolks", icon: "🥚"),
							 .init(name: "50 g Pecorino Romano cheese", icon: "🧀"),
							 .init(name: "Black pepper", icon: "")],
					 steps: [.init(title: "Preparation",
								 body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
							 .init(title: "Start",
								 body: "Start by preparing the sauce. Pour the extra virgin olive oil in a pan with the peeled and halved garlic clove so you can remove the core and make the scent more delicate. Cook for 2 minutes over high heat, add the peeled tomatoes and salt."),
							 .init(title: "Starting",
								 body: "Start by putting a pot of salted water on the burner to cook the pasta. In the meantime, remove the pork rind from the guanciale and cut it first into slices and then into strips about 1cm thick. The removed rind can be reused to flavor other things. Put the pieces into a non-stick pan and brown for about 15 minutes over medium heat, being careful not to burn it or it will smell too strong."),
							 .init(title: "Cook spagetti",
								 body: "Meanwhile, put spaghetti in boiling water and cook for the time indicated on the package. In the meantime, pour the yolks into a bowl, add most of the Pecorino cheese needed for the recipe and the remaining part will be used just before serving."),
							 .init(title: "We are almost there...",
								 body: "Season with black pepper and whip by hand. Add a tablespoon of cooking water to dilute the mixture and stir.")],
							  imageName: "carbonara",
							  category: .firstCourse,
			   trophies: [.cleaning, .heat]),

		
//		Main courses
		
		Recipe(title: "Eggplant parmigiana",
						   ingredients: [.init(name: "1.5 Kg Black eggplants", icon: "🍆"),
										 .init(name: "500 g Fior di latte mozzarella cheese", icon: ""),
										 .init(name: "1.4 L Tomato puree", icon: "🥫"),
										 .init(name: "150 g Parmigiano Reggiano DOP cheese", icon: "🧀"),
										 .init(name: "1 Yellow onions", icon: "🧅"),
										 .init(name: "35 g Coarse salt", icon: ""),
										 .init(name: "Extra virgin olive oil", icon: ""),
										 .init(name: "Black pepper", icon: ""),
										 .init(name: "Basil", icon: ""),
										 .init(name: "Fine salt", icon: ""),
										 .init(name: "Peanut seed oil", icon: "")],
								 steps: [.init(title: "Preparation",
											 body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
										 .init(title: "Start",
											 body: "Start by washing and drying the eggplant. Then with a knife remove the stem and slice the eggplant lengthwise with a vegetable slicer, or alternatively with a knife, to obtain slices about 1/8' (4-5 mm) thick."),
										 .init(title: "Make the sauce",
											 body: "As you place the slices inside a colander, sprinkle them with a very small amount of coarse salt between the layers, well distributed (you can also use a little fine salt); continue this way until you finish it all. On top of the eggplants, place a plate with a weight on it to let the eggplants purge the excess water and slightly bitter taste, the enemy of fried food. Leave it like this for at least 1 hour. Remember to rinse the slices well under running water, one by one if necessary, to remove the salt and pat them dry before use. In the meantime, slice and cut the fiordilatte cheese into strips, after which you will have very small cubes. If you don't have another colander, you can place them on a very clean cloth. In the meantime, make the sauce. In a large saucepan pour a drizzle of extra virgin olive oil and add the chopped onion, stir often so as not to burn it and let it brown for a couple of minutes."),
										 .init(title: "Simmer tomato and water",
											 body: "Then add the tomato puree and a little water, the salt and let it simmer for 45 minutes. When finished cooking do not forget to add the basil leaves by hand."),
										 .init(title: "Let's fry!",
											 body: "Heat plenty of vegetable oil and in the meantime rinse the portion of eggplant that you are going to fry and dry it with oil blotting paper: always proceed a little at a time so they do not darken. Fry a few slices at a time in boiling oil at 340° F (170° C)."),
										 .init(title: "Make layers",
											 body: "After cooking 2-3 minutes, drain on absorbent paper; do the same with all the others. At this point you should have everything you need, so move on to putting it together. Cover the bottom of an 20x30cm baking dish with a little sauce, then make the first layer by arranging the eggplant slices horizontally."),
										 .init(title: "Color the inside",
											 body: "Grate some black pepper, sprinkle with parmesan cheese and pour some cubes of fiordilatte cheese, distributing them evenly. And finally pour on a little more sauce, just enough to color the inside, repeat the same procedure this time by arranging the eggplant slices on top; continue this way to make the layers by inverting the direction of the slices each time. Between layers, remember to press gently with the palms of your hands in order to compact them."),
										 .init(title: "Let's cook!",
											 body: "On the last layer pour the remaining tomato puree, the cubes of fiordilatte and parmesan cheese. Now it's time to bake your eggplant parmigiana in a hot oven at 400° F (200° C) for 40 minutes. Once ready, let it cool a few minutes before serving.")],
										  imageName: "parmigiana",
										  category: .mainCourse,
			   trophies: [.cleaning, .heat]),
		
		Recipe(title: "Polenta medallons",
						   ingredients: [.init(name: "185 g Instant flour for polenta", icon: ""),
										 .init(name: "750 mL Water", icon: "💧"),
										 .init(name: "Fine salt", icon: ""),
										 .init(name: "60 g Smoked pancetta", icon: "🥓"),
										 .init(name: "100 g Smoked scamorza cheese", icon: "🧀")],
								 steps: [.init(title: "Preparation",
											 body: "Wash your hands.\n\nPrepare a mixing bowl, a spoon and a tablespoon for measures."),
										 .init(title: "Start",
											 body: "Fill a deep saucepan with 3 cups (750 mL) of water and set over low heat. When the water boils, add salt and pour in approximately ¾ tbsp (10 g) of olive oil, then add the polenta flour slowly, beating all the time."),
										 .init(title: "Polenta into an oiled baking dish",
											 body: "Cook over low heat for 8 minutes, continuing to stir with a spoon to prevent lumps from forming. After the end of the cooking time, turn off the heat and pour the polenta into an oiled baking dish. Spread the polenta with a spatula, but do not cover the entire base of the dish."),
										 .init(title: "Cover with plastic wrap",
											 body: "You should create a layer approximately 1 inch (2 cm) thick and the resulting square should be 8x8 inches (20x20 cm). Cover with plastic wrap and place in the refrigerator to set for 30 minutes. After this resting time, cut the scamorza cheese into rounds, aiming to obtain 8 slices, each measuring approximately 3 inches (7 cm) in diameter."),
										 .init(title: "Wrap discs",
											 body: "Take the polenta out of the refrigerator (it will have set in the meantime) and cut out 4 discs using a 3-inch (7 cm) food ring mold. Place the discs on a cutting board and wrap each one in two slices of smoked pancetta so that the edges are well covered. Transfer the discs one by one to a baking sheet lined with parchment paper."),
										 .init(title: "Cover with plastic wrap",
											 body: "After cooking 2-3 minutes, drain on absorbent paper; do the same with all the others. At this point you should have everything you need, so move on to putting it together. Cover the bottom of an 20x30cm baking dish with a little sauce, then make the first layer by arranging the eggplant slices horizontally."),
										 .init(title: "Enjoy your polenta medallons!",
											 body: "Lay two slices of scamorza cheese on top of each of the resulting medallions and broil for 5 minutes or long enough for the scamorza to melt. When cooked, take the polenta medallions out of the oven, and serve hot!"),
										 .init(title: "Let's cook!",
											 body: "On the last layer pour the remaining tomato puree, the cubes of fiordilatte and parmesan cheese. Now it's time to bake your eggplant parmigiana in a hot oven at 400° F (200° C) for 40 minutes. Once ready, let it cool a few minutes before serving.")],
										  imageName: "polenta",
										  category: .mainCourse,
			   trophies: [.cleaning, .heat])]
}
