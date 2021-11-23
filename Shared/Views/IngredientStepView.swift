//
//  IngredientStepView.swift
//  cooKids (iOS)
//
//  Created on 22/11/21.
//

import SwiftUI

struct IngredientStepView: View {
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
		VStack {
			ScrollView(.vertical) {
				VStack(spacing: 30) {
					StepsImage(image: "step2bq", introOrNot: false)
						.padding(.top, 30)
					
					Text("Take and measure ingredients")
						.font(.system(.title2, design: .rounded))
						.padding(.horizontal, 20)
					
					IngredientsListView(ingredients: recipe.ingredients, ingredientsStates: $ingredientsStates)
						.padding(.horizontal, 20)
				}
			}
			
			Spacer()
			
			NavigationLink {
				StepsView(isPresented: $isPresented, recipe: recipe, stepNumber: 1)
			} label: {
				RoundedRectangle(cornerRadius: 10)
					.frame(maxWidth: .infinity, maxHeight: 60)
					.padding(20)
					.background(.ultraThinMaterial)
					.shadow(color: .clear, radius: .zero)
					.shadow(radius: 4, y: -2)
					.overlay {
						Text("Next")
							.foregroundColor(ingredientsStates.contains(false) ? .secondary : .white)
							.font(.system(size: 24, weight: .bold, design: .rounded))
					}
			}
			.foregroundStyle(ingredientsStates.contains(false) ? .secondary : Color.orange)
			.disabled(ingredientsStates.contains(false))
		}
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
		.background {
			Image("Background")
				.resizable()
				.scaledToFill()
				.opacity(0.3)
				.edgesIgnoringSafeArea(.all)
		}
	}
}


struct IngredientStepView_Previews: PreviewProvider {
	static var previews: some View {
		IngredientStepView(isPresented: .constant(true), recipe: UserStore().recipes[0])
	}
}
