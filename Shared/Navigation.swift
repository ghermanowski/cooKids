//
//  Navigation.swift
//  cooKids
//
//  Created on 19/11/2021.
//

import SwiftUI

struct Navigation: View {
	internal init() {
		// WORKAROUND: Sets the navigation title font design to rounded
		let navigationBarAppearance = UINavigationBarAppearance()
		var titleFont = UIFont.boldSystemFont(ofSize: UIFont.buttonFontSize)
		
		if let descriptor = titleFont.fontDescriptor.withDesign(.rounded) {
			titleFont = UIFont(descriptor: descriptor, size: UIFont.buttonFontSize)
		}
		
		navigationBarAppearance.titleTextAttributes = [.font: titleFont]
		
		var largeTitleFont = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
		
		if let descriptor = largeTitleFont.fontDescriptor.withDesign(.rounded) {
			largeTitleFont = UIFont(descriptor: descriptor, size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
		}
		
		navigationBarAppearance.largeTitleTextAttributes = [.font: largeTitleFont]
		
		UINavigationBar.appearance().standardAppearance = navigationBarAppearance
	}
	
	@SceneStorage("activeTab") private var activeTab = Tab.recipes
	
	enum Tab: Int {
		case recipes, trophies, creations
	}
	
    var body: some View {
		TabView(selection: $activeTab) {
			Recipes()
			
			Trophies()
			
			Creations()
		}
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
		Navigation()
			.environmentObject(UserStore())
    }
}
