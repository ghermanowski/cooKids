//
//  RecipeView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct RecipeView: View {
    let hasTrophies : Bool
    let recipeTitle : String
    let recipeImageString : String
    let numberOfTrophies : Int
    
    var body: some View {
            ZStack {
                Image(recipeImageString)
                    .resizable()
                    .scaledToFill()
                    .mask({
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(.orange)
                            .opacity(0.87)
                    })
                    .shadow(radius: 4)
                    .frame(maxWidth: 350, maxHeight: 240)
                    .padding(.vertical, 16)
                VStack{
                    if hasTrophies {
                        HStack {
                            Spacer()
                            NumberOfTrophiesIcon(numberOfTrophies: numberOfTrophies)
                                .multilineTextAlignment(.trailing)
                                .padding([.top, .trailing], 20)
                        }.frame(alignment: .topTrailing)
                    }
                    Spacer()
                    HStack {
                        Text(recipeTitle)
                            .multilineTextAlignment(.leading)
                            .padding([.leading, .bottom], 20)
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded).bold())
                            .shadow(color: .black, radius: 10, x: 0, y: 0)
                        Spacer()
                    }
            }.frame(maxWidth: 350, maxHeight: 240)
        
            
            }.frame(maxWidth: 350, maxHeight: 240)
}
}

struct NumberOfTrophiesIcon : View {
    let numberOfTrophies : Int
    var body: some View {
        HStack {
            Text(numberOfTrophies.formatted())
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .shadow(color: .orange, radius: 2)
                .shadow(radius: 8)
            Image(systemName: "crown.fill")
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .padding(8)
                .background(Circle().fill(.orange).shadow(radius: 8))
        }
        .foregroundColor(.white)
    }
}


struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(hasTrophies: true, recipeTitle: "Title", recipeImageString : "berryQuarkImage", numberOfTrophies: 2)
    }
}
