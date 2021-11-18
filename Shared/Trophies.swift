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
				LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
					let trophies = userStore.trophies.sorted { trophy, details in
						trophy.value.progress > details.value.progress
					}
					
					ForEach(trophies, id: \.key) { trophy, _ in
						TrophyCircleView(trophy: trophy)
					}
				}
				.padding()
			}
			.navigationTitle("Trophies")
		}
    }
}

struct Trophies_Previews: PreviewProvider {
    static var previews: some View {
        Trophies()
			.environmentObject(UserStore())
    }
}
