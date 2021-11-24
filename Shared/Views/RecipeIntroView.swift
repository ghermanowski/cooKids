//
//  RecipeIntroView.swift
//  cooKids
//
//  Created on 18/11/21.
//

import SwiftUI

struct RecipeIntroView: View {
	@EnvironmentObject private var userStore: UserStore
	
	@Binding var isPresented: Bool
	
	let recipe: Recipe
	let hideStartButton: Bool
	
	var body: some View {
		ScrollView {
			VStack(spacing: 30) {
				StepsImage(image: recipe.imageName, introOrNot: true)
					.padding(.top, 30)
					.padding(.bottom, 10)
				
				LazyVGrid(columns: Array(repeating: .init(.flexible(minimum: .zero, maximum: .infinity),
														  spacing: 20,
														  alignment: .top),
										 count: 3),
						  spacing: 30) {
					let trophies = recipe.trophies.sorted {
						userStore.trophies[$0]!.progress > userStore.trophies[$1]!.progress
					}
					
					ForEach(trophies) { trophy in
						TrophyCircleView(trophy: trophy, showProgressText: false, showProgressBar: false)
					}
				}
				.padding(.horizontal)
				
				Text("Ingredients")
					.font(.system(size: 30, weight: .semibold, design: .rounded))
				
				IngredientsList(ingredients: recipe.ingredients, withChecking: false)
					.padding(.horizontal, 20)
					.padding(.bottom, 20)
			}
		}
		.navigationTitle(recipe.title)
		.navigationBarTitleDisplayMode(.large)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button {
					isPresented = false
				} label: {
					Image(systemName: "chevron.down")
						.font(.system(.headline, design: .rounded).weight(.heavy))
				}
			}
		}
		.safeAreaInset(edge: .bottom) {
			if !hideStartButton {
				NavigationLink {
					Ingredients(isPresented: $isPresented, recipe: recipe)
				} label: {
					RoundedRectangle(cornerRadius: 10)
						.fill(.orange)
						.frame(maxWidth: .infinity, maxHeight: 60)
				}
				.padding(20)
				.background(.ultraThinMaterial)
				.shadow(color: .clear, radius: .zero)
				.shadow(radius: 4, y: -2)
				.overlay {
					Text("Start")
						.foregroundColor(.white)
						.font(.system(size: 24, weight: .bold, design: .rounded))
				}
			}
		}
		.background {
			Image("Background")
				.resizable()
				.scaledToFill()
				.opacity(0.3)
		}
	}
}

struct RecipeIntroView_Previews: PreviewProvider {
	static var previews: some View {
		RecipeIntroView(isPresented: .constant(true), recipe: UserStore().recipes[0], hideStartButton: false)
			.environmentObject(UserStore())
	}
}
