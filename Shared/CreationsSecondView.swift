//
//  CreationsSecondView.swift
//  cooKids
//
//  Created by Anna Izzo on 19/11/21.
//

import SwiftUI

struct CreationsSecondView: View {
	@EnvironmentObject private var userStore: UserStore
	@State var recipeTitle: Creation.RecipeTitle
	
	var body: some View {
			ScrollView (.vertical) {
				VStack {
					ForEach(userStore.creationsPhotos.filter{$0.recipeTitle == recipeTitle}) { photos in
						RecipeView(recipe: photos)
					}
					.padding(.vertical, 30)
				}
			}
			.navigationTitle(recipeTitle.rawValue)
	}
}

struct CreationsSecondView_Previews: PreviewProvider {
	static var previews: some View {
		CreationsSecondView(recipeTitle: .nutellaCrepes).environmentObject(UserStore())
	}
}
