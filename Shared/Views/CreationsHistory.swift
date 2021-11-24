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
				ForEach(userStore.creationsPhotos.filter { $0.recipeTitle == recipeTitle }.sorted { $0.date > $1.date }) { creationPhoto in
					if let photo = creationPhoto.photo {
						Card(uiImage: photo, title: creationPhoto.title, isFullWidth: true)
					} else {
						Card(imageName: creationPhoto.imageName, title: creationPhoto.title, isFullWidth: true)
					}
				}
			}
			.frame(width: UIScreen.main.bounds.width)
			.padding(.vertical, 30)
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
