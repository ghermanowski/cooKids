//
//  BackgroundImage.swift
//  cooKids
//
//  Created on 24/11/2021.
//

import Foundation
import SwiftUI

struct BackgroundImage: ViewModifier {
	func body(content: Content) -> some View {
		content
			.background {
				Image("Background")
					.resizable()
					.scaledToFill()
			}
	}
}

extension View {
	func backgroundImage() -> some View {
		modifier(BackgroundImage())
	}
}
