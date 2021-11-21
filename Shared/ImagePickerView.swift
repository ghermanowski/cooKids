//
//  ImagePickerView.swift
//  cooKids
//
//  Created by Anna Izzo on 21/11/21.
//

import UIKit
import SwiftUI

struct ImagePickerView : UIViewControllerRepresentable {
	
	@Binding var selectedImage: UIImage?
	
	@Environment(\.presentationMode) var isPresented
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .camera
		imagePicker.delegate = context.coordinator
		return imagePicker
	}
	
	func makeCoordinator() -> Coordinator {
		return Coordinator(picker: self)
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
		
	}
	
}
