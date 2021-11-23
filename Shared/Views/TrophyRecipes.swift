//
//  TrophyRecipes.swift
//  cooKids
//
//  Created on 23/11/2021.
//

import SwiftUI

struct TrophyRecipes: View {
	@EnvironmentObject private var userStore: UserStore
	
	let trophy: Trophy
	
	var body: some View {
		ScrollView(.vertical) {
			VStack(spacing: 30) {
				ForEach(userStore.recipes.filter { $0.trophies.contains(trophy) }) { recipe in
					RecipeCard(recipe: recipe)
				}
			}
			.frame(width: UIScreen.screens.first?.bounds.width)
			.padding(.vertical, 20)
			.padding(.bottom, 10)
		}
		.navigationTitle(trophy.title)
	}
}

struct TrophyRecipes_Previews: PreviewProvider {
	static var previews: some View {
		TrophyRecipes(trophy: .baking)
			.environmentObject(UserStore())
	}
}
