//
//  StepsView.swift
//  cooKids
//
//  Created on 22/11/21.
//

import SwiftUI

struct StepsView: View {
	@EnvironmentObject private var userStore: UserStore
	
	@Binding var isPresented: Bool
	
	@State private var showAlert = false
	
	let recipe: Recipe
	let stepNumber: Int
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 30) {
				if let imageName = recipe.steps[stepNumber - 1].imageName {
					StepsImage(image: imageName, introOrNot: false)
						.frame(width: UIScreen.screens.first?.bounds.width)
						.padding(.top, 30)
				}
				
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
			}
		}
		.interactiveDismissDisabled()
		.navigationTitle("Step \(stepNumber)")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button {
					showAlert.toggle()
				} label: {
					Image(systemName: "xmark.circle.fill")
						.font(.system(.headline, design: .rounded).weight(.heavy))
						.symbolRenderingMode(.hierarchical)
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
				if stepNumber < recipe.steps.count {
					StepsView(isPresented: $isPresented, recipe: recipe, stepNumber: stepNumber + 1)
				} else {
					TakeAPictureView(isPresented: $isPresented, recipe: recipe)
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
		.background {
			Image("Background")
				.resizable()
				.scaledToFill()
				.opacity(0.3)
		}
	}
}

struct StepsView_Previews: PreviewProvider {
	static var previews: some View {
		StepsView(isPresented: .constant(true), recipe: UserStore().recipes[0], stepNumber: 1)
			.environmentObject(UserStore())
	}
}
