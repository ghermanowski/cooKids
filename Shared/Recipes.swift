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
				VStack(alignment: .leading, spacing: .zero) {
					ForEach(Recipe.Category.allCases) { category in
						Text(category.rawValue)
							.font(.title)
							.fontWeight(.semibold)
							.padding(.horizontal, 8)
						
						ScrollView(.horizontal, showsIndicators: false) {
							HStack(spacing: 30) {
								ForEach(userStore.recipes.filter { $0.category == category }) { recipe in
									RecipeView(recipe: recipe)
								}
							}
							.padding(.vertical, 30)
						}
					}
				}
				.padding(.leading, 28)
				.padding(.top, 20)
			}
			.navigationTitle("Recipes")
		}
	}
}

struct Recipes_Previews: PreviewProvider {
	static var previews: some View {
		Recipes()
			.environmentObject(UserStore())
	}
}
