//
//  RecipeView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeView: View {
	let recipe: RapresentableInRectProtocol
	
	var trophyCount: some View {
		HStack {
			Text(recipe.trophies.count.formatted())
				.font(.system(.largeTitle, design: .rounded).weight(.heavy))
				.shadow(color: .orange, radius: 2)
				.shadow(radius: 8)
			
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
		Image(recipe.imageName)
			.resizable()
			.scaledToFill()
			.frame(width: 312, height: 210)
			.cornerRadius(32)
			.shadow(radius: 5, y: 2)
			.overlay {
				VStack {
					if !recipe.trophies.isEmpty {
						HStack {
							Spacer()
							
							trophyCount
						}
						.frame(alignment: .topTrailing)
					}
					
					Spacer()
					
					HStack {
						Text(recipe.title)
							.multilineTextAlignment(.leading)
							.foregroundColor(.white)
							.font(.system(.title, design: .rounded).bold())
							.shadow(color: .black, radius: 10, x: 0, y: 0)
							.padding([.leading, .bottom], 12)
							.padding(.leading, 4)
						
						Spacer()
					}
				}
			}
	}
}

struct RecipeView_Previews: PreviewProvider {
	static var previews: some View {
		RecipeView(recipe: Recipe(title: "Berry Quark",
								  ingredients: [],
								  steps: [],
								  imageName: "berryQuarkImage",
								  category: .sweets,
								  trophies: [.cleaning]))
	}
}
