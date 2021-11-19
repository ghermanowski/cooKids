//
//  RecipeIntroView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeIntroView: View {
	@EnvironmentObject private var userStore: UserStore
	
	var body: some View {
		NavigationView {
			ZStack {
				VStack {
					ScrollView (.vertical) {
						
						VStack (spacing: 30) {
							StepsImage(image: userStore.recipes[0].imageName, introOrNot: true)
							
							ScrollView (.horizontal) {
								ForEach(userStore.recipes[0].trophies) { trophy in                                TrophyCircleView(trophy: trophy, showProgressText: false)
										.padding(5)
								}
							}.padding(.horizontal, 20)
							
							Text("Ingredients")
								.font(.system(size: 30, weight: .semibold, design: .rounded))
							IngredientsListView(ingredients: userStore.recipes[0].ingredients, withChecking: false)
								.padding(.horizontal, 20)
						}
					}
					Spacer()
					BigButtonBottom(buttonText: "COOK", systemIcon: "fork.knife") {
						//
					}
				}
			}
		}
	}
}

struct RecipeIntroView_Previews: PreviewProvider {
	static var previews: some View {
		RecipeIntroView().environmentObject(UserStore())
	}
}
