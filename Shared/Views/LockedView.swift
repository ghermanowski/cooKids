//
//  LockedView.swift
//  cooKids
//
//  Created by Mariano Piscitelli on 19/11/21.
//

import SwiftUI

struct LockedView: View {
	
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
	}
	
	var body: some View {
		Image(recipe.imageName)
			.resizable()
			.scaledToFill()
			.blur(radius: 8)
			.frame(width: 312, height: 210)
			.mask({
				RoundedRectangle(cornerRadius: 40)
					.foregroundColor(.orange)
					.opacity(0.87)})
			.shadow(radius: 3)
			.overlay {
				
				VStack{
					Image(systemName: "lock.fill")
						.foregroundColor(Color.white)
						.font(.system(size: 80))
					HStack() {
					if !recipe.trophies.isEmpty {
						
							trophyCount
					}
				
						Text(recipe.title)
							.foregroundColor(.white)
							.font(.system(size: 40, weight: .heavy, design: .rounded))
							.shadow(color: .orange, radius: 2)
							.shadow(radius: 8)
						
				}
			}
				.padding(.top, 35)
			}
	}
}

struct LockedView_Previews: PreviewProvider {
    static var previews: some View {
		LockedView(recipe: Recipe(title: "to unlock",
								  ingredients: [],
								  steps: [],
								  imageName: "carbonara",
								  category: .sweets,
								  trophies: [.cleaning, .heat, .baking, .sweets, .cleaning],
								  requiredTrophyProgress: 10))
	}
}
