//
//  CreationsView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct CreationsView: View {
	let dumbCrationsPhotos: [CreationRecipe] = [
		 CreationRecipe(title: "Caprese", imageName: "Caprese"),
		 CreationRecipe(title: "Caprese", imageName: "Caprese"),
		 CreationRecipe(title: "Caprese", imageName: "Caprese"),
		 CreationRecipe(title: "Berry Quark", imageName: "berrieQuarkImage"),
		 CreationRecipe(title: "Berry Quark", imageName: "berryQuarkImage")
	]
	var body: some View {
		NavigationView {
			ScrollView (.vertical) {
				VStack (spacing: 60){
					ForEach(dumbCrationsPhotos) { photo in
						RecipeView(recipe: photo)
					}
				}.padding(.top, 30)
			}.navigationTitle("Creations")
		}.tabItem {
			Image(systemName: "photo.on.rectangle.angled")
			Text("Creations")
		}
	}
}

struct CreationRecipe: Identifiable, RapresentableInRectProtocol {
	var id: String { title }
	let title: String
	let imageName: String
	let trophies : [Trophy] = []
}




struct CreationsView_Previews: PreviewProvider {
	static var previews: some View {
		CreationsView()
	}
}
