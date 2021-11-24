//
//  StepTitle.swift
//  cooKids
//
//  Created on 24/11/2021.
//

import SwiftUI

struct StepTitle: View {
	internal init(_ title: String) {
		self.title = title
	}
	
	let title: String
	
    var body: some View {
		Text(title)
			.font(.system(.title, design: .rounded).weight(.semibold))
			.padding(.horizontal, 30)
    }
}

struct StepTitle_Previews: PreviewProvider {
    static var previews: some View {
        StepTitle("Berry Quark")
    }
}
