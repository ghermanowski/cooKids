//
//  IngredientsListView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct IngredientsListView: View {
	let ingredients: [Recipe.Ingredient]
	var body: some View {
		VStack (alignment: .leading, spacing: 5){
			ForEach (ingredients, id: \.self.name) { ingredient in
				HStack (spacing: 26){
					Text(ingredient.icon)
					Text(ingredient.name)
					Spacer()
				}.font(.system(size: 20, weight: .regular, design: .rounded))
			}.padding(.vertical, 8)
		}
	}
}

struct IngredientsListView_Previews: PreviewProvider {
	static var previews: some View {
		IngredientsListView(ingredients: UserStore().recipes[0].ingredients).environmentObject(UserStore())
	}
}
