//
//  FinalProgressView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct FinalProgressView: View {
	@EnvironmentObject private var userStore: UserStore
	
	@Binding var isPresented: Bool
	
	let recipe: Recipe
	
	var body: some View {
		ZStack {
			VStack(alignment: .leading, spacing: 30) {
				Group {
					Text("You have made progress in:")
						.font(.system(.title2, design: .rounded))
					
					ScrollView(.horizontal) {
						HStack(spacing: 30) {
							ForEach(recipe.trophies) { trophy in
								TrophyCircleView(trophy: trophy, showProgressText: false, showProgressBar: true)
									.padding(5)
							}
						}
					}
					
					Text("New recipes unlocked:")
						.font(.system(.title2, design: .rounded))
					
					ScrollView(.horizontal) {
						HStack(spacing: 30) {
							//
						}
					}
				}
				.padding(.horizontal, 20)
				
				Spacer()
				
				BigButtonBottom(buttonText: "Done", systemIcon: "checkmark") {
					isPresented = false
				}
			}
//			.padding(.horizontal, 20)
			.padding(.top, 30)
		}
		.navigationTitle("Progress")
		.navigationBarTitleDisplayMode(.large)
		.navigationBarBackButtonHidden(true)
	}
}

struct FinalProgressView_Previews: PreviewProvider {
	static var previews: some View {
		FinalProgressView(isPresented: .constant(true), recipe: UserStore().recipes[0])
			.environmentObject(UserStore())
	}
}
