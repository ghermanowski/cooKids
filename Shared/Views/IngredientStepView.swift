//
//  IngredientStepView.swift
//  cooKids (iOS)
//
//  Created by Anna Izzo on 22/11/21.
//

import SwiftUI

struct IngredientStepView: View {
	@State var thisRecipe: Recipe
	var body: some View {
		VStack(spacing: 30){
			StepsImage(image: "step2bq", introOrNot: false)
				.padding(.top, 30)
			Text("Take and measure ingredients")
				.font(.system(size: 30, weight: .semibold, design: .rounded))
			IngredientsListView(ingredients: thisRecipe.ingredients, withChecking: true)
				.padding(.horizontal, 20)
			Spacer()
			NavigationLink {
				//
			} label: {
				BigButtonBottom(buttonText: "Next", systemIcon: "") {
					//
				}
			}
		}
		
	}
}


struct IngredientStepView_Previews: PreviewProvider {
    static var previews: some View {
		IngredientStepView(thisRecipe: UserStore().recipes[7])
    }
}
