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
		TabView{
		NavigationView {
				ScrollView(.vertical) {
					VStack(alignment: .leading, spacing: .zero) {
						ForEach(Recipe.Category.allCases) { category in
							Text(category.rawValue)
								.font(.largeTitle)
								.padding([.top, .horizontal])
							
							ScrollView(.horizontal, showsIndicators: false) {
								HStack(spacing: 20) {
									ForEach(userStore.recipes.filter { $0.category == category }) { recipe in
										RecipeView(recipe: recipe)
									}
								}
								.padding(.horizontal)
							}
						}
					}
				}.navigationTitle("Recipes")
			 }.tabItem{
				 Image(systemName: "fork.knife")
			   Text("Recipes")
			
			}
		
			Trophies()
			CreationsView()
		}
		
	}
}

struct Recipes_Previews: PreviewProvider {
	static var previews: some View {
		Recipes()
			.environmentObject(UserStore())
	}
}
