//
//  IngredientStepView.swift
//  cooKids (iOS)
//
//  Created by Anna Izzo on 22/11/21.
//

import SwiftUI

struct IngredientStepView: View {
	var thisRecipe: Recipe
	var body: some View {
		VStack {
			ScrollView(.vertical) {
				VStack(spacing: 30){
					
					StepsImage(image: "step2bq", introOrNot: false)
						.padding(.top, 30)
					
					Text("Take and measure ingredients")
						.font(.system(.title2, design: .rounded))
						.padding(.horizontal, 20)
					
					IngredientsListView(ingredients: thisRecipe.ingredients, withChecking: true)
						.padding(.horizontal, 20)
				}
			}
			Spacer()
			
			NavigationLink(destination: StepsView(thisRecipe: thisRecipe)) {
				RoundedRectangle(cornerRadius: 10)
						.fill(.orange)
						.frame(maxWidth: .infinity, maxHeight: 60)
						.padding(20)
						.background(.ultraThinMaterial)
						.shadow(color: .clear, radius: .zero)
						.shadow(radius: 4, y: -2)
						.overlay {
							Text("Next")
								.foregroundColor(.white)
								.font(.system(size: 24, weight: .bold, design: .rounded))
						}
			}
		}
		.navigationBarTitleDisplayMode(.inline)
	}
}


struct IngredientStepView_Previews: PreviewProvider {
    static var previews: some View {
		IngredientStepView(thisRecipe: (UserStore().recipes[9]))
    }
}
