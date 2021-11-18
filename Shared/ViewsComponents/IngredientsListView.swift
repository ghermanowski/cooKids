//
//  IngredientsListView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import SwiftUI

struct IngredientsListView: View {
    var ingredients: [Recipe.Ingredient]
    
    var body: some View {
        List {
            ForEach (ingredients, id: \.self.name) { ingredient in
                HStack (spacing: 26){
                    Text(ingredient.icon)
                    Text(ingredient.name)
                }.font(.system(size: 20, weight: .regular, design: .rounded))
            }.listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }.listStyle(.plain)
    }
}

struct IngredientsListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView(ingredients: [])
    }
}
