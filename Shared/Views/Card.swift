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
			.shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
			.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
			.overlay(LinearGradient(gradient: Gradient(colors: [.white.opacity(0),.gray.opacity(0.1), .black.opacity(0), .black.opacity(0), .black.opacity(0.2), .black.opacity(0.55)]), startPoint: .top, endPoint: .bottom).cornerRadius(32))
			.overlay(alignment: .bottomLeading) {
				Text(title)
					.multilineTextAlignment(.leading)
					.foregroundColor(.white)
					.font(.system(.title, design: .rounded).bold())
//					.shadow(color: .black, radius: 10, x: 0, y: 0)
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
