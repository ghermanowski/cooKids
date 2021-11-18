//
//  RecipeIntroView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeIntroView: View {
    @EnvironmentObject private var userStore: UserStore
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView (.vertical) {
                    
                    VStack (spacing: 30) {
                        StepsImage(image: "berryQuarkImage", introOrNot: true)
                        
                        ScrollView (.horizontal) {
                            ForEach(userStore.recipes[0].trophies) { trophy in                                TrophyCircleView(trophy: trophy, showProgressText: false)
                            }
                        }.padding(.horizontal, 20)
                        
                        Text("Ingredients")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        IngredientsListView(ingredients: userStore.recipes[0].ingredients)
                            .padding(.horizontal, 20)
                    }
                }
                BigButtonBottom(buttonText: "COOK", systemIcon: "photo") {
                    //
                }
            }
        }
    }
}

struct RecipeIntroView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIntroView().environmentObject(UserStore())
    }
}
