//
//  StepsView.swift
//  cooKids
//
//  Created on 22/11/21.
//

import SwiftUI

struct StepsView: View {
	@EnvironmentObject private var userStore: UserStore
	
	@State private var showAlert = false
	
	let recipe: Recipe
	let stepNumber: Int
	
	var body: some View {
		VStack(alignment: .leading, spacing: 30) {
			StepsImage(image: recipe.steps[stepNumber - 1].imageName ?? "", introOrNot: false)
				.frame(width: UIScreen.screens.first?.bounds.width)
				.padding(.top, 30)
			
			HStack {
				Spacer()
				
				Text(recipe.steps[stepNumber - 1].title)
					.font(.system(.title, design: .rounded))
					.padding(.horizontal, 20)
				
				Spacer()
			}
			
			Text(recipe.steps[stepNumber - 1].body)
				.font(.system(.title2, design: .rounded))
				.padding(.horizontal, 30)
			
			Spacer()
			
			NavigationLink {
				if stepNumber < recipe.steps.count {
					StepsView(recipe: recipe, stepNumber: stepNumber + 1)
				} else {
					TakeAPictureView(thisRecipe: recipe)
				}
			} label: {
				RoundedRectangle(cornerRadius: 10)
					.fill(.orange)
					.frame(maxWidth: .infinity, maxHeight: 60)
					.overlay {
						Text("Next")
							.foregroundColor(.white)
							.font(.system(size: 24, weight: .bold, design: .rounded))
					}
			}
			.padding(20)
			.background(.ultraThinMaterial)
			.shadow(color: .clear, radius: .zero)
			.shadow(radius: 4, y: -2)
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle("Step \(stepNumber)")
		.background {
			Image("Background")
				.resizable()
				.scaledToFill()
				.opacity(0.3)
				.edgesIgnoringSafeArea([.vertical, .horizontal])
		}
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

struct StepsView_Previews: PreviewProvider {
	static var previews: some View {
		StepsView(recipe: UserStore().recipes[0], stepNumber: 1)
			.environmentObject(UserStore())
	}
}
