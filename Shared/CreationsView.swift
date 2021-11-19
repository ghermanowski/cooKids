//
//  CreationsView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct CreationsView: View {
	var dumbCrationsPhotos: [CreationRecipe] = [
		CreationRecipe(imageName: "Caprese", date: Date.now, recipeTitle: "Caprese"),
		CreationRecipe(imageName: "Caprese", date: Date.now, recipeTitle: "Caprese"),
		CreationRecipe(imageName: "Caprese", date: Date.now, recipeTitle: "Caprese"),
		CreationRecipe(imageName: "Berrie Quark", date: Date.now, recipeTitle: "berryQuarkImage")
	]
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical) {
				VStack(spacing: 20) {
					ForEach(dumbCrationsPhotos) { photo in
						RecipeView(recipe: photo)
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

struct CreationRecipe: Identifiable, RapresentableInRectProtocol {
	var id: String { title }
	var title: String = ""
	let imageName: String
	let trophies: [Trophy] = []
	let date: Date
	let recipeTitle: String
}
struct CreationPhoto: Identifiable, RapresentableInRectProtocol {
	var id: String { title }
	var title: String = ""
	let imageName: String
	let trophies: [Trophy] = []
	
}


struct CreationsView_Previews: PreviewProvider {
	static var previews: some View {
		CreationsView()
	}
}
