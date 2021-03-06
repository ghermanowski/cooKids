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
			VStack(alignment: .leading, spacing: 30) {
				StepImage(imageName: "step2bq")
				
				StepTitle("Get the Ingredients")
				
				IngredientsList(ingredients: recipe.ingredients, ingredientsStates: $ingredientsStates)
			}
		}
		.interactiveDismissDisabled(ingredientsStates.contains(true))
		.navigationTitle("Ingredients")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button {
					if ingredientsStates.contains(true) {
						showAlert.toggle()
					} else {
						isPresented.toggle()
					}
				} label: {
					Image(systemName: ingredientsStates.contains(true) ? "xmark.circle.fill" : "chevron.down")
						.font(.system(.headline, design: .rounded).weight(.heavy))
						.symbolRenderingMode(ingredientsStates.contains(true) ? .hierarchical : .monochrome)
				}
				.tint(.white)
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
				StepView(isPresented: $isPresented, recipe: recipe, stepNumber: 1)
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
		.backgroundImage()
	}
}


struct Ingredients_Previews: PreviewProvider {
	static var previews: some View {
		Ingredients(isPresented: .constant(true), recipe: UserStore().recipes[0])
	}
}
