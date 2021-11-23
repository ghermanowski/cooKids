//
//  FinalProgressView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct FinalProgressView: View {
	@EnvironmentObject private var userStore: UserStore
	
	@Binding var isPresented: Bool
	
	@State var previousTotalTrophyProgress: Int = .max
	
	let recipe: Recipe
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 20) {
				Text("You have made progress in:")
					.font(.system(.title, design: .rounded).weight(.medium))
					.padding(.leading, 20)
					.onAppear {
						previousTotalTrophyProgress = userStore.totalTrophyProgress
						
						Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
							for trophy in recipe.trophies {
								withAnimation {
									userStore.trophies[trophy]!.count += 1
								}
							}
						}
					}
				
				LazyVGrid(columns: Array(repeating: .init(.flexible(minimum: .zero, maximum: .infinity),
														  spacing: 20,
														  alignment: .top),
										 count: 3),
						  spacing: 30) {
					let trophies = recipe.trophies.sorted {
						userStore.trophies[$0]!.progress > userStore.trophies[$1]!.progress
					}
					
					ForEach(trophies) { trophy in
						TrophyCircleView(trophy: trophy, showProgressText: false, showProgressBar: true)
					}
				}
				.padding(.horizontal)
				.padding(.bottom, 10)
				
				let unlockedRecipes = userStore.recipes.filter {
					$0.requiredTrophyProgress > previousTotalTrophyProgress &&
						$0.requiredTrophyProgress < userStore.totalTrophyProgress
				}
				
				if !unlockedRecipes.isEmpty {
					VStack(alignment: .leading, spacing: 10) {
						Text("New recipes unlocked:")
							.font(.system(.title, design: .rounded).weight(.medium))
							.padding(.leading, 20)
						
						ScrollView(.horizontal, showsIndicators: false) {
							HStack(spacing: 30) {
								ForEach(unlockedRecipes) { recipe in
									RecipeCard(recipe: recipe)
								}
							}
							.padding(.horizontal, 30)
							.padding(.vertical, 10)
						}
					}
				}
			}
			.padding(.top, 30)
		}
		.navigationTitle("Well done!")
		.navigationBarTitleDisplayMode(.large)
		.navigationBarBackButtonHidden(true)
		.safeAreaInset(edge: .bottom) {
			BigButtonBottom(buttonText: "Done", systemIcon: "checkmark") {
				isPresented = false
			}
		}
	}
}

struct FinalProgressView_Previews: PreviewProvider {
	static var previews: some View {
		FinalProgressView(isPresented: .constant(true), recipe: UserStore().recipes[0])
			.environmentObject(UserStore())
	}
}
