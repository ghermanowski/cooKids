//
//  Recipes.swift
//  cooKids
//
//  Created by Marco Giocondo Mignone on 18/11/21.
//

import SwiftUI

struct Recipes: View {
	@EnvironmentObject private var userStore: UserStore
	
	var body: some View{
		NavigationView {
			ScrollView(.vertical) {
				LazyVStack(alignment: .leading, spacing: 40) {
					ForEach(Recipe.Category.allCases) { category in
						VStack(alignment: .leading, spacing: 20) {
							Text(category.rawValue)
								.font(.system(.title, design: .rounded).weight(.semibold))
								.padding(.leading, 20)
							
							ScrollView(.horizontal, showsIndicators: false) {
								HStack(spacing: 30) {
									ForEach(userStore.recipes.filter { $0.category == category }) { recipe in
										RecipeView(recipe: recipe)
									}
								}
								.padding(.leading, 30)
							}
						}
					}
				}
				.padding(.top, 20)
			}
			.navigationTitle("Recipes")
		}
		.tabItem { Label("Recipes", systemImage: "fork.knife") }
		.tag(Navigation.Tab.recipes)
	}
}

struct Recipes_Previews: PreviewProvider {
	static var previews: some View {
		Recipes()
			.environmentObject(UserStore())
	}
}
