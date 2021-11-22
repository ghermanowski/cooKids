//
//  RecipeIntroView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeIntroView: View {
	@EnvironmentObject private var userStore: UserStore
	var thisRecipe: Recipe
	
	var body: some View {
		VStack {
			ScrollView (.vertical) {
				VStack (spacing: 30) {
					StepsImage(image: thisRecipe.imageName, introOrNot: true)
						.padding(.top, 30)
					
					ScrollView (.horizontal) {
						HStack (spacing: 20) {
							ForEach(thisRecipe.trophies) { trophy in                                TrophyCircleView(trophy: trophy, showProgressText: false)
									.scaleEffect(0.86)
							}
						}
					}.padding(.horizontal, 20)
					
					Text("Ingredients")
						.font(.system(size: 30, weight: .semibold, design: .rounded))
					IngredientsListView(ingredients: thisRecipe.ingredients, withChecking: false)
						.padding(.horizontal, 20)
				}
			}
			Spacer()
			NavigationLink(destination: IngredientStepView(thisRecipe: thisRecipe)) {
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

struct RecipeIntroView_Previews: PreviewProvider {
	static var previews: some View {
		RecipeIntroView(thisRecipe: (UserStore().recipes[7]))
			.environmentObject(UserStore())
	}
}
