//
//  TakeAPictureView.swift
//  cooKids
//
//  Created by Anna Izzo on 20/11/21.
//

import SwiftUI
import UIKit

struct TakeAPictureView: View {
	@EnvironmentObject private var userStore: UserStore
	@State var thisRecipe: Recipe
	@State private var selectedImage: UIImage?
	@State private var isImagePickerDisplay = false
	@State private var showAlert = false
	
	var body: some View {
			VStack(spacing: 30) {
				if let selectedImage = selectedImage {
					Image(uiImage: selectedImage)
						.resizable()
						.scaledToFill()
						.frame(width: 374, height: 250)
						.mask({
							RoundedRectangle(cornerRadius: 40)
								.frame(width: 374, height: 250)
						})
						.overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 3).foregroundColor(.gray))
						.padding(.horizontal, 20)
				} else {
					StepsImage(image: "takePicture", introOrNot: false)
						.padding(.top, 30)
				}
				Text("Good Job!")
					.font(.system(.title, design: .rounded))
					.bold()
				Text(selectedImage == nil ? "Take a picture of your creation!" : "Nice creation!")
					.font(.system(.title2, design: .rounded))
				Spacer()
				BigButtonBottom(buttonText: selectedImage == nil ? "Take a picture" : "Next", systemIcon: selectedImage == nil ? "camera.fill" : "") {
					if let photo = selectedImage {
						addCreationAndUpdateStore(photo: photo)
						//go to next screen
					} else {
						openCamera()
					}
				}
			}
			.frame(width: UIScreen.screens.first?.bounds.width)
			.alert("Camera not available", isPresented: $showAlert) {
				//
			}
			.sheet(isPresented: self.$isImagePickerDisplay) {
				ImagePickerView(selectedImage: $selectedImage)
			}
			.navigationBarTitleDisplayMode(.inline)
	}
	
	func openCamera() {
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			isImagePickerDisplay.toggle()
		} else {
			showAlert.toggle()
		}
	}
	
	func addCreationAndUpdateStore(photo: UIImage) {
		var newCreation = Creation(recipeTitle: Creation.RecipeTitle(rawValue: thisRecipe.title) ?? .caprese, date: Date.now, imageName: nil, photo: photo)
		userStore.creations.append(newCreation)
		userStore.creationsPhotos.append(newCreation.changeTitle(titleFor: .dateTitle))
		userStore.creationsRecipe.append(newCreation.changeTitle(titleFor: .recipeTitle))
	}
}

struct TakeAPictureView_Previews: PreviewProvider {
	static var previews: some View {
		TakeAPictureView(thisRecipe: Recipe(title: "Tomato Bruschetta",
											ingredients: [.init(name: "8 slices Homemade bread", icon: "🥖"),
														  .init(name: "500 g Cluster tomatoes", icon: "🍅"),
														  .init(name: "8 leaves Basil", icon: "🌱"),
														  .init(name: "Oregano", icon: "🌿"),
														  .init(name: "Extra virgin olive oil", icon: "🫒"),
														  .init(name: "Fine salt", icon: "🧂"),
														  .init(name: "Black pepper", icon: "")],
											steps: [],
											imageName: "bruschette",
											category: .appetizers,
											trophies: [.cleaning, .heat]))
			.environmentObject(UserStore())
	}
}
