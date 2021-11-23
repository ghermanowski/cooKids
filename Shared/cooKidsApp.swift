//
//  cooKidsApp.swift
//  Shared
//
//  Created on 16/11/2021.
//

import SwiftUI

@main
struct cooKidsApp: App {
	var body: some Scene {
		WindowGroup {
			Navigation()
				.font(.system(.body, design: .rounded))
				.environmentObject(UserStore())
		}
	}
}
