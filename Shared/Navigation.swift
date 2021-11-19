//
//  Navigation.swift
//  cooKids
//
//  Created by Gregor Hermanowski on 19. November.
//

import SwiftUI

struct Navigation: View {
	@SceneStorage("activeTab") private var activeTab = Tab.recipes
	
	enum Tab: Int {
		case recipes, trophies, creations
	}
	
    var body: some View {
		TabView(selection: $activeTab) {
			Recipes()
			
			Trophies()
			
			CreationsView()
		}
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
