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
	
	@State private var shouldGoNext = false
	@State private var selectedImage: UIImage?
	@State private var showImagePicker = false
	@State private var showAlert = false
	
	let recipe: Recipe
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 30) {
				if let selectedImage = selectedImage {
					StepImage(uiImage: selectedImage)
				} else {
					StepImage(imageName: "takePicture")
				}
				
				StepTitle(selectedImage == nil ? "Take a Picture of Your Creation!" : "Nice Creation!")
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
			NavigationLink (destination: FinalProgressView(isPresented: $isPresented, recipe: recipe), isActive: $shouldGoNext)
			{
				RoundedRectangle(cornerRadius: 10)
					.fill(.orange)
					.frame(maxWidth: .infinity, maxHeight: 60)
					.overlay {
						HStack {
							Image(systemName: selectedImage == nil ? "camera.fill" : "")
							Text(selectedImage == nil ? "Take a picture" : "Next")
						}
						.foregroundColor(.white)
						.font(.system(size: 24, weight: .bold, design: .rounded))
					}
					.onTapGesture {
						if let photo = selectedImage {
							addCreationAndUpdateStore(photo: photo)
							shouldGoNext.toggle()
						} else {
							openCamera()
						}
					}
			}
			.padding(20)
			.background(.ultraThinMaterial)
			.shadow(color: .clear, radius: .zero)
			.shadow(radius: 4, y: -2)

		}
		.backgroundImage()
		.sheet(isPresented: self.$showImagePicker) {
			ImagePickerView(selectedImage: $selectedImage)
		}
		.alert("Camera not available", isPresented: $showAlert) {
			//
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
		var newCreation = Creation(recipeTitle: Creation.RecipeTitle(rawValue: recipe.title) ?? .unknown, date: Date.now, imageName: nil, photo: photo)
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
