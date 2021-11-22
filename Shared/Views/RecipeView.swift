//
//  RecipeImage.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeImage: View {
	let recipe: Recipe
	
	var trophyCount: some View {
		HStack {
			Text(recipe.trophies.count.formatted())
				.font(.system(.largeTitle, design: .rounded).weight(.heavy))
				.shadow(color: .gray, radius: 2)
				.shadow(radius: 3)
			
			Image(systemName: "crown.fill")
				.font(.system(.headline, design: .rounded))
				.padding(8)
				.background(Circle().fill(.orange).shadow(radius: 8))
		}
		.foregroundColor(.white)
		.multilineTextAlignment(.trailing)
		.padding([.top, .trailing], 12)
	}
	
	var body: some View {
		LabelledImage(imageName: recipe.imageName, title: recipe.title)
			.overlay(alignment: .topTrailing) {
				if !recipe.trophies.isEmpty {
					trophyCount
				}
			}
	}
}

struct RecipeImage_Previews: PreviewProvider {
	static var previews: some View {
		RecipeImage(recipe: UserStore().recipes[0])
	}
}
