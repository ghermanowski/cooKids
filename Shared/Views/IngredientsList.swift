//
//  IngredientsList.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct IngredientsList: View {
	internal init(ingredients: [Recipe.Ingredient], ingredientsStates: Binding<[Bool]>) {
		self.ingredients = ingredients
		self.withChecking = true
		
		_ingredientsStates = ingredientsStates
	}
	
	internal init(ingredients: [Recipe.Ingredient], withChecking: Bool) {
		self.ingredients = ingredients
		self.withChecking = withChecking
		
		_ingredientsStates = .constant([])
	}
	
	@EnvironmentObject private var userStore: UserStore
	
	var ingredients: [Recipe.Ingredient]
	
	@Binding var ingredientsStates: [Bool]
	
	let withChecking : Bool
	
	var body: some View {
		VStack(alignment: .leading) {
			ForEach(0..<ingredients.count, id: \.self) { index in
				HStack(spacing: 20) {
					Label {
						Text(ingredients[index].name)
							.padding(.leading, 8)
					} icon: {
						Text(ingredients[index].icon)
					}
					.font(.system(.title3, design: .rounded))
					.padding(.leading, 5)
					
					Spacer()
					
					if withChecking {
						Button {
							ingredientsStates[index].toggle()
						} label: {
							Image(systemName: ingredientsStates[index] ? "checkmark.circle.fill" : "checkmark.circle")
								.font(.headline)
								.imageScale(.large)
						}
						.tint(ingredientsStates[index] ? .accentColor : .accentColor.opacity(0.33))
					}
				}
				.padding(.vertical, 8)
			}
		}
		.padding(.horizontal, 20)
		.padding(.bottom, 30)
	}
}

struct IngredientsListView_Previews: PreviewProvider {
	static var previews: some View {
		IngredientsList(ingredients: UserStore().recipes[0].ingredients, withChecking: false)
			.environmentObject(UserStore())
	}
}
