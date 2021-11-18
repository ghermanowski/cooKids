//
//  StepsImage.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct StepsImage: View {
    let image : String
    //the intro image is smaller
    let introOrNot : Bool
    
    var body: some View {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 500, maxHeight: introOrNot ? 210 : 250)
                    .mask({
                        RoundedRectangle(cornerRadius: 40)
                            .frame(maxWidth: 500, maxHeight: introOrNot ? 210 : 250)
                    })
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 3).foregroundColor(.gray))
                /* or the shadow
                 .shadow(color: .gray, radius: 2, x: 0, y: 0) */
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
    }
}


struct StepsImage_Previews: PreviewProvider {
    static var previews: some View {
        StepsImage(image: "vicky-ng-yIh0i6TYGrs-unsplash", introOrNot: false)
    }
}
