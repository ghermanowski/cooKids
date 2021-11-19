//
//  IngredientsListView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct IngredientsListView: View {
	internal init(ingredients: [Recipe.Ingredient], withChecking: Bool) {
		_ingredients = .init(initialValue: ingredients)
		self.withChecking = withChecking
	}
	
	@EnvironmentObject private var userStore: UserStore
	
	@State var ingredients: [Recipe.Ingredient]
	let withChecking : Bool
	var body: some View {
		VStack (alignment: .leading, spacing: 5){
			ForEach($ingredients, id: \.self.name) { $ingredient in
				HStack (spacing: 26){
					Text(ingredient.icon)
					Text(ingredient.name)
					Spacer()
					if withChecking {
						Button {
							ingredient.isChecked.toggle()
						} label: {
							Image(systemName: ingredient.isChecked ? "checkmark.circle.fill" : "checkmark.circle")
						}
						.tint(ingredient.isChecked ? .accentColor : .secondary)
					}
				}
				.font(.system(size: 20, weight: .regular, design: .rounded))
			}
			.padding(.vertical, 8)
		}
	}
}

struct IngredientsListView_Previews: PreviewProvider {
	static var previews: some View {
		IngredientsListView(ingredients: UserStore().recipes[0].ingredients, withChecking: true)
			.environmentObject(UserStore())
	}
}
