//
//  IngredientsListView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct IngredientsListView: View {
	@EnvironmentObject private var userStore: UserStore
	var ingredients: [Recipe.Ingredient]
	var body: some View {
		VStack (alignment: .leading, spacing: 5){
			ForEach (ingredients, id: \.self.name) { ingred in
				HStack (spacing: 26){
					Text(ingred.icon)
					Text(ingred.name)
					Spacer()
					Button {
//						ingred.isChecked.toggle()
					} label: {
						Image(systemName: ingred.isChecked ? "checkmark.circle" : "checkmark.circle")
					}

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
