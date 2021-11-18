//
//  BigButtonBottom.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct BigButtonBottom: View {
    
    var buttonText : String
    var systemIcon : String
    var action : () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Button (action: action, label: {
                HStack {
                    Image(systemName: systemIcon)
                    Text(buttonText)
                }.font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity)
            })
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .controlSize(.large)
                .padding(20)
                .background(Rectangle().fill(.ultraThinMaterial).ignoresSafeArea( edges: .bottom).shadow(radius: 4, y: -2))
        }
    }
}

struct BigButtonBottom_Previews: PreviewProvider {
    static var previews: some View {
        BigButtonBottom(buttonText: "Text", systemIcon: "fork.knife", action: {})
    }
}