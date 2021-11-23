//
//  Ingredients.swift
//  cooKids (iOS)
//
//  Created on 22/11/21.
//

import SwiftUI

struct Ingredients: View {
	internal init(isPresented: Binding<Bool>, recipe: Recipe) {
		_isPresented = isPresented
		
		_ingredientsStates = .init(initialValue: Array(repeating: false, count: recipe.ingredients.count))
		
		self.recipe = recipe
	}
	
	@Binding private var isPresented: Bool
	
	@State private var ingredientsStates: [Bool]
	@State private var showAlert = false
	
	let recipe: Recipe
	
	var body: some View {
		ScrollView(.vertical) {
			VStack(spacing: 30) {
				StepsImage(image: "step2bq", introOrNot: false)
					.padding(.top, 30)
				
				Text("Take and measure ingredients")
					.font(.system(.title2, design: .rounded))
					.padding(.horizontal, 20)
				
				IngredientsList(ingredients: recipe.ingredients, ingredientsStates: $ingredientsStates)
					.padding(.horizontal, 20)
					.padding(.bottom, 30)
			}
		}
		.interactiveDismissDisabled(ingredientsStates.contains(true))
		.navigationTitle("Ingredients")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button {
					showAlert.toggle()
				} label: {
					Image(systemName: "xmark")
						.font(.system(.headline, design: .rounded).weight(.heavy))
						.foregroundColor(.red)
				}
				.confirmationDialog("Are you sure you want to stop? You will lose your progress.",
									isPresented: $showAlert,
									titleVisibility: .visible) {
					Button("Stop", role: .destructive) {
						isPresented = false
					}
				}
			}
		}
		.safeAreaInset(edge: .bottom) {
			NavigationLink {
				StepsView(isPresented: $isPresented, recipe: recipe, stepNumber: 1)
			} label: {
				RoundedRectangle(cornerRadius: 10)
					.frame(maxWidth: .infinity, maxHeight: 60)
					.overlay {
						Text("Next")
							.foregroundColor(ingredientsStates.contains(false) ? .secondary : .white)
							.font(.system(size: 24, weight: .bold, design: .rounded))
					}
			}
			.disabled(ingredientsStates.contains(false))
			.foregroundStyle(ingredientsStates.contains(false) ? .secondary : Color.orange)
			.padding(20)
			.background(.ultraThinMaterial)
			.shadow(color: .clear, radius: .zero)
			.shadow(radius: 4, y: -2)
		}
		.background {
			Image("Background")
				.resizable()
				.scaledToFill()
				.opacity(0.3)
		}
	}
}


struct Ingredients_Previews: PreviewProvider {
	static var previews: some View {
		Ingredients(isPresented: .constant(true), recipe: UserStore().recipes[0])
	}
}
