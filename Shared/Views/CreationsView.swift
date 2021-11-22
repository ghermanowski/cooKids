//
//  CreationsView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import Foundation
import SwiftUI

struct CreationsView: View {
	@EnvironmentObject private var userStore: UserStore
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical) {
				VStack(spacing: 30) {
					ForEach(Creation.RecipeTitle.allCases) { recipeTitle in
						
						if let creations = userStore.creationsRecipe.filter{ $0.recipeTitle == recipeTitle} {
							if !creations.isEmpty {
								NavigationLink (destination: CreationsHistory(recipeTitle: recipeTitle)) {
									RecipeView(recipe: creations.first!)
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
		CreationsView()
			.environmentObject(UserStore())
	}
}