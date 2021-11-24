//
//  GradientView.swift
//  cooKids
//
//  Created by Mariano Piscitelli on 24/11/21.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
		
		
		
		
		
		
        Image("carbonara")
			.resizable()
			.scaledToFill()
			.frame(width: 290, height: 195)
			.shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
			.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
			.overlay(LinearGradient(gradient: Gradient(colors: [.white.opacity(0),.gray.opacity(0.1), .black.opacity(0), .black.opacity(0), .black.opacity(0.2), .black.opacity(0.55)]), startPoint: .top, endPoint: .bottom))
			.overlay(alignment: .bottomLeading) {
				Text("Carbonara")
					.multilineTextAlignment(.leading)
					.foregroundColor(.white)
					.font(.system(.title, design: .rounded).bold())
					.padding([.leading, .bottom], 12)
					.padding(.leading, 4)
			}
		.cornerRadius(32)
		LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
    }
		
}









struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
