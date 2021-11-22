//
//  CreationsHistory.swift
//  cooKids
//
//  Created by Anna Izzo on 19/11/21.
//

import SwiftUI

struct CreationsHistory: View {
	@EnvironmentObject private var userStore: UserStore
	
	let recipeTitle: Creation.RecipeTitle
	
	var body: some View {
		ScrollView(.vertical) {
			VStack(spacing: 30) {
				ForEach(userStore.creationsPhotos.filter { $0.recipeTitle == recipeTitle }) { photo in
					RecipeView(recipe: photo)
				}
			}
			.frame(width: UIScreen.screens.first?.bounds.width)
			.padding(.vertical, 20)
			.padding(.bottom, 10)
		}
		.navigationTitle(recipeTitle.rawValue)
	}
}

struct CreationsHistory_Previews: PreviewProvider {
	static var previews: some View {
		CreationsHistory(recipeTitle: .nutellaCrepes)
			.environmentObject(UserStore())
	}
}