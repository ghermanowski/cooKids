//
//  RecipeIntroView.swift
//  cooKids
//
//  Created on 18/11/21.
//

import SwiftUI

struct RecipeIntroView: View {
	@EnvironmentObject private var userStore: UserStore
	
	@Environment(\.dismiss) private var dismiss
	
	let recipe: Recipe
	
	var body: some View {
		VStack {
			ScrollView (.vertical) {
				VStack (spacing: 30) {
					StepsImage(image: recipe.imageName, introOrNot: true)
						.padding(.top, 30)
						.padding(.bottom, 20)
					
					LazyVGrid(columns: Array(repeating: .init(.flexible(minimum: .zero, maximum: .infinity),
															  spacing: 20,
															  alignment: .top),
											 count: 3),
							  spacing: 30) {
						let trophies = recipe.trophies.sorted {
							userStore.trophies[$0]!.progress > userStore.trophies[$1]!.progress
						}
						
						ForEach(trophies) { trophy in
							TrophyCircleView(trophy: trophy, showProgressText: false)
						}
					}
							  .padding(.horizontal, 20)
					
					Text("Ingredients")
						.font(.system(size: 30, weight: .semibold, design: .rounded))
					
					IngredientsListView(ingredients: recipe.ingredients, withChecking: false)
						.padding(.horizontal, 20)
				}
			}
			
			Spacer()
			
			NavigationLink {
				IngredientStepView(recipe: recipe)
			} label: {
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
		.navigationTitle(recipe.title)
		.navigationBarTitleDisplayMode(.large)
	}
}

struct RecipeIntroView_Previews: PreviewProvider {
	static var previews: some View {
		RecipeIntroView(recipe: (UserStore().recipes[0]))
			.environmentObject(UserStore())
	}
}
