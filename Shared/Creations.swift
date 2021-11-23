//
//  Creations.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import Foundation
import SwiftUI

struct Creations: View {
	@EnvironmentObject private var userStore: UserStore
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical) {
				VStack(spacing: 30) {
					ForEach(Creation.RecipeTitle.allCases) { recipeTitle in
						if let creations = userStore.creationsRecipe.filter { $0.recipeTitle == recipeTitle },
						!creations.isEmpty {
							NavigationLink {
								CreationsHistory(recipeTitle: recipeTitle)
							} label: {
								if let photo = creations.first!.photo {
									Card(uiImage: photo, title: creations.first!.title)
								} else {
									Card(imageName: creations.first!.imageName, title: creations.first!.title)
								}
							}
						}
					}
				}
				.frame(width: UIScreen.screens.first?.bounds.width)
				.padding(.vertical, 20)
				.padding(.bottom, 10)
				
				NavigationLink(destination: TakeAPictureView(thisRecipe: userStore.recipes[2])) {
					Text ("Go to take a picture")
				}
			}
			.navigationTitle("Creations")
		}
		.tabItem { Label("Creations", systemImage: "photo.on.rectangle.angled") }
		.tag(Navigation.Tab.creations)
	}
}


struct CreationsView_Previews: PreviewProvider {
	static var previews: some View {
		Creations()
			.environmentObject(UserStore())
	}
}
