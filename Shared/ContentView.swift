//
//  ContentView.swift
//  Shared
//
//  Created on 16/11/2021.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject private var userStore: UserStore
	
	var body: some View {
		ScrollView {
			VStack(spacing: 24) {
				ForEach(userStore.recipies) { recipe in
					HStack {
						Spacer()
						
						Text(recipe.title)
							.font(.system(.largeTitle, design: .rounded).weight(.bold))
						
						Spacer()
					}
					.padding()
					
					ForEach(recipe.steps) { step in
						VStack(alignment: .leading) {
							HStack {
								Spacer()
								
								Text(step.title)
									.font(.system(.title3, design: .rounded).weight(.semibold))
								
								Spacer()
							}
							.padding()
							
							Text(step.body)
								.font(.system(.body, design: .rounded).weight(.medium))
						}
						.multilineTextAlignment(.leading)
					}
					
					ForEach(recipe.trophies) { trophy in
						if let trophyDetails = userStore.trophies[trophy] {
							HStack {
								Text(trophy.icon)
								
								Text("\(trophyDetails.count) / \(trophyDetails.maximum)")
								
								Text(trophyDetails.title)
							}
						}
					}
				}
				
				HStack {
					Spacer()
					
					Text("Trophies")
						.font(.system(.largeTitle, design: .rounded).weight(.bold))
					
					Spacer()
				}
				.padding()
				
				let trophies = userStore.trophies.sorted {
					$0.value.progress > $1.value.progress
				}
				
				ForEach(trophies, id: \.key) { trophy, trophyDetails in
					HStack {
						Text(trophy.icon)
						
						Text("\(trophyDetails.count) / \(trophyDetails.maximum)")
						
						Text(trophyDetails.title)
					}
				}
			}
			.padding()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(UserStore())
	}
}
