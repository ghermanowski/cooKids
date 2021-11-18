//
//  IngredientsListView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct IngredientsListView: View {
    var ingredientsAndEmoji : [(emoji: String, text: String)]
    
    var body: some View {
        List {
            ForEach (ingredientsAndEmoji, id: \.0) { item in
                HStack (spacing: 26){
                    Text(item.emoji)
                    Text(item.text)
                }.font(.system(size: 20, weight: .regular, design: .rounded))
            }.listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }.listStyle(.plain)
    }
}

struct IngredientsListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView(ingredientsAndEmoji: [("🍯" , "Ingredient text"), ("🍯" , "Ingredient text")])
    }
}
