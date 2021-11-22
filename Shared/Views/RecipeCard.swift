//
//  RecipeCard.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeCard: View {
	@EnvironmentObject private var userStore: UserStore
	
	let recipe: Recipe
	
	func trophyCount(count: Int, showUnlockText: Bool) -> some View {
		HStack(alignment: .firstTextBaseline) {
			Text(count.formatted())
				.shadow(color: .orange, radius: 2)
			
			Image(systemName: "crown.fill")
				.imageScale(.small)
				.padding(8)
				.background(Circle().fill(.orange).shadow(radius: 4))
			
			if showUnlockText {
				Text("to unlock")
					.shadow(color: .orange, radius: 2)
			}
		}
		.font(.system(.title, design: .rounded).weight(.heavy))
		.foregroundColor(.white)
		.multilineTextAlignment(.trailing)
		.padding(12)
	}
	
	var body: some View {
		Card(imageName: recipe.imageName, title: recipe.title)
			.overlay(alignment: .topTrailing) {
				if !recipe.trophies.isEmpty {
					trophyCount(count: recipe.trophies.count, showUnlockText: false)
				}
			}
			.overlay {
				if userStore.totalTrophyProgress < recipe.requiredTrophyProgress {
					VStack(spacing: .zero) {
						Image(systemName: "lock.fill")
							.foregroundColor(Color.white)
							.font(.system(size: 72).weight(.bold))
							.shadow(color: .orange.opacity(0.75), radius: 6)
							.padding(.bottom, 12)
						
						trophyCount(count: recipe.requiredTrophyProgress - userStore.totalTrophyProgress, showUnlockText: true)
					}
					.padding(.top, 12)
					.frame(width: 312, height: 210)
					.background(.ultraThinMaterial)
					.cornerRadius(32)
				}
			}
	}
}

struct RecipeCard_Previews: PreviewProvider {
	static var previews: some View {
		RecipeCard(recipe: UserStore().recipes[0])
	}
}
