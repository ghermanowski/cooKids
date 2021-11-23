//
//  LabelledImage.swift
//  cooKids
//
//  Created on 22/11/21.
//

import SwiftUI

struct Card: View {
	internal init(imageName: String, title: String) {
		self.image = Image(imageName)
		self.title = title
	}
	
	internal init(uiImage: UIImage, title: String) {
		self.image = Image(uiImage: uiImage)
		self.title = title
	}
	
	let image: Image
	let title: String
	
	var body: some View {
		image
			.resizable()
			.scaledToFill()
			.frame(width: 290, height: 195)
			.cornerRadius(32)
			.shadow(radius: 5)
			.overlay(alignment: .bottomLeading) {
				Text(title)
					.multilineTextAlignment(.leading)
					.foregroundColor(.white)
					.font(.system(.title, design: .rounded).bold())
					.shadow(color: .black, radius: 10, x: 0, y: 0)
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
