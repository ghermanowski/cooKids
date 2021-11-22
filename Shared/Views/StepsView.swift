//
//  StepsView.swift
//  cooKids
//
//  Created by Anna Izzo on 22/11/21.
//

import SwiftUI

struct StepsView: View {
	var thisRecipe: Recipe
	
	var body: some View {
		VStack(spacing: 30){
			
			StepsImage(image: thisRecipe.imageName, introOrNot: false)
				.padding(.top, 30)
			
			Text("")
				.font(.system(.title, design: .rounded))
				.padding(.horizontal, 20)
			Text("")
				.font(.system(.title2, design: .rounded))

			
			Spacer()
			
//			NavigationLink(destination: StepsView(thisRecipe: thisRecipe), isActive: $showNext) {EmptyView() }
//			BigButtonBottom(buttonText: "Next", systemIcon: "") { }
		}
	}
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
		StepsView(thisRecipe: (UserStore().recipes[7]))
    }
}
