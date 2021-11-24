//
//  StepImage.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct StepImage: View {
	internal init(imageName: String) {
		self.image = Image(imageName)
	}
	
	internal init(uiImage: UIImage) {
		self.image = Image(uiImage: uiImage)
	}
	
	let image : Image
	
	var body: some View {
		image
			.resizable()
			.scaledToFill()
			.mask {
				Rectangle()
					.frame(width: UIScreen.screens.first?.bounds.width, height: 230)
			}
			.frame(width: UIScreen.screens.first?.bounds.width, height: 230)
		}
}


struct StepImage_Previews: PreviewProvider {
	static var previews: some View {
		StepImage(imageName: "berryQuarkImage")
	}
}
