//
//  LabelledImage.swift
//  cooKids
//
//  Created on 22/11/21.
//

import SwiftUI

struct Card: View {
	internal init(imageName: String, title: String, isFullWidth: Bool = false) {
		self.image = Image(imageName)
		self.title = title
		self.isFullWidth = isFullWidth
	}
	
	internal init(uiImage: UIImage, title: String, isFullWidth: Bool = false) {
		self.image = Image(uiImage: uiImage)
		self.title = title
		self.isFullWidth = isFullWidth
	}
	
	let image: Image
	let title: String
	let isFullWidth: Bool
	
	var body: some View {
		image
			.resizable()
			.scaledToFill()
			.frame(width: isFullWidth ? UIScreen.main.bounds.width - 40 : 290, height: 195)
			.overlay(LinearGradient(gradient: Gradient(colors: [.white.opacity(0),.gray.opacity(0.1), .black.opacity(0), .black.opacity(0), .black.opacity(0.2), .black.opacity(0.55)]), startPoint: .top, endPoint: .bottom))
			.cornerRadius(32)
			.shadow(radius: 7, y: 2)
			.overlay(alignment: .bottomLeading) {
				Text(title)
					.multilineTextAlignment(.leading)
					.foregroundColor(.white)
					.font(.system(.title, design: .rounded).bold())
					.padding([.leading, .bottom], 12)
					.padding(.leading, 4)
				
			}
	}
}

struct LabelledImage_Previews: PreviewProvider {
	static var previews: some View {
		Card(imageName: "berryQuarkImage", title: "Berry Quark")
	}
}
