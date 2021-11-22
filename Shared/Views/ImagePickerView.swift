//
//  ImagePickerView.swift
//  cooKids
//
//  Created by Anna Izzo on 21/11/21.
//

import UIKit
import SwiftUI

struct ImagePickerView : UIViewControllerRepresentable {
	@Environment(\.dismiss) var dismiss
	
	@Binding var selectedImage: UIImage?
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .camera
		imagePicker.delegate = context.coordinator
		return imagePicker
	}
	
	func makeCoordinator() -> Coordinator {
		return Coordinator(picker: self)
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
	
	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		private let picker: ImagePickerView
		
		init (picker: ImagePickerView) {
			self.picker = picker
		}
		
		/*
		 This method is coming from UIImagePickerControllerDelegate. It will be triggered when the user captured a pic using Camera or when the user selects an image from the photo library (not our case). We are getting the image from info[.originalImage] and converting it into a UIImage object. Then assigning that to “selectedImage” variable of ImagePickerView (picker) object.
		 */
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			guard let selectedImage = info[.originalImage] as? UIImage else { return }
			self.picker.selectedImage = selectedImage
			// Dismisses the view after picking the image
			self.picker.dismiss()
		}
	}
}
