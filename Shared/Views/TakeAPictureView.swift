//
//  TakeAPictureView.swift
//  cooKids
//
//  Created on 20/11/21.
//

import SwiftUI
import UIKit

struct TakeAPictureView: View {
	@EnvironmentObject private var userStore: UserStore
	
	@Binding var isPresented : Bool
	
	@State private var selectedImage: UIImage?
	@State private var showImagePicker = false
	@State private var showAlert = false
	
	let recipe: Recipe
	
	var body: some View {
		ScrollView {
			VStack(spacing: 30) {
				if let selectedImage = selectedImage {
					Image(uiImage: selectedImage)
						.resizable()
						.scaledToFill()
						.frame(width: ((UIScreen.screens.first?.bounds.width)! - 40), height: 230)
						.mask({
							RoundedRectangle(cornerRadius: 40)
								.frame(width: ((UIScreen.screens.first?.bounds.width)! - 40), height: 230)
						})
						.overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 3).foregroundColor(.gray))
						.padding(.horizontal, 20)
						.padding(.top, 30)
						.frame(width: UIScreen.screens.first?.bounds.width)
				} else {
					StepsImage(image: "takePicture", introOrNot: false)
						.padding(.top, 30)
						.frame(width: UIScreen.screens.first?.bounds.width)
				}
				
				Text("Good Job!")
					.font(.system(.title, design: .rounded))
				
				Text(selectedImage == nil ? "Take a picture of your creation!" : "Nice creation!")
					.font(.system(.title2, design: .rounded))
			}
		}
		.interactiveDismissDisabled()
		.navigationTitle("Last Step")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				if selectedImage == nil {
					NavigationLink("Skip") {
						FinalProgressView(isPresented: $isPresented, recipe: recipe)
					}
				}
			}
		}
		.safeAreaInset(edge: .bottom) {
			BigButtonBottom(buttonText: selectedImage == nil ? "Take a picture" : "Next", systemIcon: selectedImage == nil ? "camera.fill" : "") {
				if let photo = selectedImage {
					addCreationAndUpdateStore(photo: photo)
					//go to next screen
				} else {
					openCamera()
				}
			}
			.alert("Camera not available", isPresented: $showAlert) {
				//
			}
			.sheet(isPresented: $showImagePicker) {
				ImagePickerView(selectedImage: $selectedImage)
			}

		}
		.background {
			Image("Background")
				.resizable()
				.scaledToFill()
				.opacity(0.3)
		}
	}
	
	func openCamera() {
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			showImagePicker.toggle()
		} else {
			showAlert.toggle()
		}
	}
	
	func addCreationAndUpdateStore(photo: UIImage) {
		var newCreation = Creation(recipeTitle: Creation.RecipeTitle(rawValue: recipe.title) ?? .caprese, date: Date.now, imageName: nil, photo: photo)
		userStore.creations.append(newCreation)
		userStore.creationsPhotos.append(newCreation.changeTitle(titleFor: .dateTitle))
		userStore.creationsRecipe.append(newCreation.changeTitle(titleFor: .recipeTitle))
	}
}

struct TakeAPictureView_Previews: PreviewProvider {
	static var previews: some View {
		TakeAPictureView(isPresented: .constant(true),
						 recipe: Recipe(title: "Tomato Bruschetta",
										ingredients: [.init(name: "8 slices Homemade bread", icon: "🥖"),
													  .init(name: "500 g Cluster tomatoes", icon: "🍅"),
													  .init(name: "8 leaves Basil", icon: "🌱"),
													  .init(name: "Oregano", icon: "🌿"),
													  .init(name: "Extra virgin olive oil", icon: "🫒"),
													  .init(name: "Fine salt", icon: "🧂"),
													  .init(name: "Black pepper")],
										steps: [],
										imageName: "bruschette",
										category: .appetizers,
										trophies: [.cleaning, .heat], requiredTrophyProgress: 10))
			.environmentObject(UserStore())
	}
}
