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
				.font(.system(size: 40, weight: .heavy, design: .rounded))
				.shadow(color: .orange, radius: 2)
				.shadow(radius: 8)
			
			Image(systemName: "crown.fill")
				.font(.system(size: 17, weight: .bold, design: .rounded))
				.padding(8)
				.background(Circle().fill(.orange).shadow(radius: 8))
		}
		.foregroundColor(.white)
		.multilineTextAlignment(.trailing)
		.padding([.top, .trailing], 20)
	}
	
	var body: some View {
		ZStack {
			Image(recipe.imageName)
				.resizable()
				.scaledToFill()
				.mask({
					RoundedRectangle(cornerRadius: 40)
						.foregroundColor(.orange)
						.opacity(0.87)
				})
				.shadow(radius: 4)
				.frame(maxWidth: 350, maxHeight: 240)
				.padding(.vertical, 16)
			
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
						.padding([.leading, .bottom], 20)
						.foregroundColor(.white)
						.font(.system(.largeTitle, design: .rounded).bold())
						.shadow(color: .black, radius: 10, x: 0, y: 0)
					
					Spacer()
				}
			}
		}
		.frame(maxWidth: 350, maxHeight: 240)
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
