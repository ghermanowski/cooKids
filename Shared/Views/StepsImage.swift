//
//  StepsImage.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct StepsImage: View {
	let image : String
	//the intro image is smaller
	let introOrNot : Bool
	
	var body: some View {
		Image(image)
			.resizable()
			.scaledToFill()
			.frame(width: ((UIScreen.screens.first?.bounds.width)! - 40), height: introOrNot ? 210 : 230)
			.cornerRadius(32)
			.shadow(radius: 5)
		}
}


struct StepsImage_Previews: PreviewProvider {
	static var previews: some View {
		StepsImage(image: "berryQuarkImage", introOrNot: false)
	}
}
