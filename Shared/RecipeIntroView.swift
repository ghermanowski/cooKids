//
//  RecipeIntroView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeIntroView: View {
    @EnvironmentObject private var userStore : UserStore
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView (.vertical) {
                    VStack (spacing: 30) {
                        StepsImage(image: "berryQuarkImag", introOrNot: true)
                    }
                }
            }
        }
    }
}

struct RecipeIntroView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIntroView()
    }
}
