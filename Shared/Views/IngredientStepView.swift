//
//  IngredientStepView.swift
//  cooKids (iOS)
//
//  Created on 22/11/21.
//

import SwiftUI

struct IngredientStepView: View {
	@State private var showAlert = false
	
	let recipe: Recipe
	
	var body: some View {
		VStack {
			ScrollView(.vertical) {
				VStack(spacing: 30) {
					StepsImage(image: "step2bq", introOrNot: false)
						.padding(.top, 30)
					
					Text("Take and measure ingredients")
						.font(.system(.title2, design: .rounded))
						.padding(.horizontal, 20)
					
					IngredientsListView(ingredients: recipe.ingredients, withChecking: true)
						.padding(.horizontal, 20)
				}
			}
			
			Spacer()
			
			NavigationLink {
				StepsView(recipe: recipe, stepNumber: 1)
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
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle("Ingredients")
		.background(content: {
			Image("Background")
				.resizable()
				.scaledToFill()
				.opacity(0.3)
				.edgesIgnoringSafeArea([.vertical, .horizontal])
		})
		.navigationBarItems(trailing: Button(action: {
			showAlert.toggle()
		}, label: {
			Image(systemName: "xmark.circle.fill")
				.foregroundColor(.gray)
		}))
		.alert("Are you sure you want to stop?", isPresented: $showAlert) {
			Button("Stop", role: .destructive) {
				//back to recipes
			}
		} message: {
			Text("You will lose your progress")
		}
	}
}


struct IngredientStepView_Previews: PreviewProvider {
	static var previews: some View {
		IngredientStepView(recipe: (UserStore().recipes[0]))
	}
}
