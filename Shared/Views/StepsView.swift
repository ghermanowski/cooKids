//
//  StepsView.swift
//  cooKids
//
//  Created on 22/11/21.
//

import SwiftUI

struct StepsView: View {
	@EnvironmentObject private var userStore: UserStore

	let thisRecipe: Recipe
	@State var stepCount = 0
	@State var showTakePicture = false
	@State private var showAlert = false
	
	var body: some View {
		VStack(spacing: 30){
			
			StepsImage(image: thisRecipe.steps[stepCount].imageName ?? "", introOrNot: false)
				.padding(.top, 30)
			
			Text(thisRecipe.steps[stepCount].title)
				.font(.system(.title, design: .rounded))
				.padding(.horizontal, 20)
			Text(thisRecipe.steps[stepCount].body)
				.font(.system(.title2, design: .rounded))
				.padding(.horizontal, 20)
			
			Spacer()
			NavigationLink(destination: TakeAPictureView(thisRecipe: thisRecipe), isActive: $showTakePicture) {
				RoundedRectangle(cornerRadius: 10)
					.fill(.orange)
					.frame(maxWidth: .infinity, maxHeight: 60)
					.overlay {
						Text("Next")
							.foregroundColor(.white)
							.font(.system(size: 24, weight: .bold, design: .rounded))
					}
			}
			.onTapGesture {
				if stepCount < (thisRecipe.steps.count - 1) {
					stepCount += 1
				} else {
					showTakePicture.toggle()
				}
			}
			.padding(20)
			.background(.ultraThinMaterial)
			.shadow(color: .clear, radius: .zero)
			.shadow(radius: 4, y: -2)
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle("Step \(stepCount + 1)")
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

struct StepsView_Previews: PreviewProvider {
	static var previews: some View {
		StepsView(thisRecipe: (UserStore().recipes[0]))
	}
}
