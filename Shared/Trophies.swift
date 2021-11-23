//
//  Trophies.swift
//  cooKids
//
//  Created on 18/11/2021.
//

import SwiftUI

struct Trophies: View {
	@EnvironmentObject private var userStore: UserStore
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: Array(repeating: .init(.flexible(minimum: .zero, maximum: .infinity),
														  spacing: 20,
														  alignment: .top),
										 count: 3),
						  spacing: 30) {
					let trophies = userStore.trophies.sorted {
						$0.value.progress > $1.value.progress
					}
					
					ForEach(trophies, id: \.key) { trophy, _ in
						NavigationLink {
							TrophyRecipes(trophy: trophy)
						} label: {
							TrophyCircleView(trophy: trophy, showProgressText: true, showProgressBar: true)
						}
						.tint(.primary)
					}
				}
				.padding(.horizontal)
				.padding(.vertical, 30)
			}
			.navigationTitle("Trophies")
		}
		.tabItem { Label("Trophies", systemImage: "crown") }
		.tag(Navigation.Tab.trophies)
    }
}

struct Trophies_Previews: PreviewProvider {
	static var previews: some View {
		Trophies()
			.environmentObject(UserStore())
	}
}
