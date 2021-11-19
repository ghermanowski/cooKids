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
				LazyVStack(alignment: .leading, spacing: 30) {
					ForEach(Recipe.Category.allCases) { category in
						VStack(alignment: .leading, spacing: 10) {
							Text(category.rawValue)
								.font(.system(.title, design: .rounded).weight(.semibold))
								.padding(.leading, 20)
							
							ScrollView(.horizontal, showsIndicators: false) {
								HStack(spacing: 25) {
									ForEach(userStore.recipes.filter { $0.category == category }) { recipe in
										RecipeView(recipe: recipe)
									}
								}
								.padding(.horizontal, 30)
								.padding(.vertical, 10)
							}
						}
					}
				}
				.padding(.top, 10)
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
