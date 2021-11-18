//
//  TrophyCircleView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import Foundation
import SwiftUI

struct TrophyCircleView: View {
	@EnvironmentObject private var userStore: UserStore
	
	let trophy: Trophy
	
	func progressCircle(progress: Double) -> some View {
		Circle()
			.trim(from: 0, to: progress)
			.stroke(Color.orange, style: .init(lineWidth: 10, lineCap: .round))
			.rotationEffect(.degrees(-90))
	}
	
	var body: some View {
		VStack {
			if let trophyDetails = userStore.trophies[trophy] {
				ZStack {
					Circle()
						.fill(.linearGradient(colors: [.orange.opacity(0.1), .orange.opacity(0.6)],
											  startPoint: .top,
											  endPoint: .bottom))
						.overlay(progressCircle(progress: trophyDetails.progress))
						.padding(.top, 5)
						.padding(.horizontal, 5)
						.frame(width: 100, height: 100)
					
					Text(trophy.icon)
						.font(.system(size: 50))
				}
				
				Text(trophyDetails.title)
					.font(.system(.title3, design: .rounded).weight(.semibold))
				
				Text("\(trophyDetails.count) / \(trophyDetails.maximum)")
					.font(.system(.body, design: .rounded).weight(.medium))
					.foregroundStyle(.secondary)
			}
		}
	}
}

struct TrophyCircleView_Previews: PreviewProvider {
	static var previews: some View {
		TrophyCircleView(trophy: .baking)
			.environmentObject(UserStore())
	}
}
