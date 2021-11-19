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
								NavigationLink (destination: CreationsSecondView(recipeTitle: recipeTitle)) {
									RecipeView( recipe: creations.first!)
								}
							}
						}
					}
				}
				.padding(.vertical, 30)
				.frame(width: UIScreen.screens.first?.bounds.width)
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
