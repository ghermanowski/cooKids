//
//  FinalProgressView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct FinalProgressView: View {
	var body: some View {
		NavigationView {
			ZStack{
				
				VStack (alignment: .leading, spacing: 30){
					Group {
						Group {
							Text("You have made progress in")
								.font(.system(.title2, design: .rounded))
							ScrollView(.horizontal)
							{
								HStack (spacing: 30){
									
								}
							}
						}
						Group {
							Text("New recipes unlocked")
								.font(.system(.title2, design: .rounded))
							ScrollView(.horizontal)
							{
								HStack (spacing: 30){
									
								}
							}
						}
					}
					.padding(.horizontal, 20)
					Spacer()
					BigButtonBottom(buttonText: "DONE", systemIcon: "checkmark") {
						//
					}
				}
//				.padding(.horizontal, 20)
				.padding(.top, 30)
			}.navigationTitle("Progress")
		}
	}
}

struct FinalProgressView_Previews: PreviewProvider {
	static var previews: some View {
		FinalProgressView()
	}
}
