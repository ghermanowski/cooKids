//
//  IngredientsListView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct IngredientsListView: View {
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
		VStack(alignment: .leading, spacing: 5) {
			ForEach(0..<ingredients.count, id: \.self) { index in
				HStack(spacing: 26) {
					Label {
						Text(ingredients[index].name)
							.fontWeight(.light)
							.foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.268))
							.padding(.leading, 16)
					} icon: {
						Text(ingredients[index].icon)
					}
					
					Spacer()
					
					if withChecking {
						Button {
							ingredientsStates[index].toggle()
						} label: {
							Image(systemName: ingredientsStates[index] ? "checkmark.circle.fill" : "checkmark.circle")
								.font(.headline)
						}
						.tint(ingredientsStates[index] ? .accentColor : .accentColor.opacity(0.33))
					}
				}
				.font(.system(.body, design: .rounded))
				.padding(.vertical, 8)
			}
		}
	}
}

struct IngredientsListView_Previews: PreviewProvider {
	static var previews: some View {
		IngredientsListView(ingredients: UserStore().recipes[0].ingredients, withChecking: false)
			.environmentObject(UserStore())
	}
}
