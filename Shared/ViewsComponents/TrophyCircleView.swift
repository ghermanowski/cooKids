//
//  TrophyCircleView.swift
//  cooKids
//
//  Created by Anna Izzo on 18/11/21.
//

import Foundation
import SwiftUI

struct TrophyCircleView: View {
    let hasCaption : Bool
    let text : String
    let numberOnNumber : String?
    let emojiIcon : String
    let progressFrom0to1 : Double
    
    
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [.orange.opacity(0.1), .orange.opacity(0.6)], startPoint: .top, endPoint: .bottom))
                    .overlay(ProgressCircleStroke(progress: progressFrom0to1))
                .padding(.top, 5)
                .padding(.horizontal, 5)
                .frame(width: 100, height: 100)
                Text(emojiIcon)
                    .font(.system(size: 62))
            }
            Text(text)
                .font(.title3)
            if hasCaption {
            Text(numberOnNumber ?? "")
                .font(.callout)
                .foregroundColor(.secondary)}
        }
    }
}

struct ProgressCircleStroke : View {
    let progress : Double
    var body: some View {
    Circle()
        .trim(from: 0, to: progress)
        .stroke(Color.orange, style: .init(lineWidth: 8, lineCap: .round))
        .rotationEffect(Angle(degrees: -90.0))
    }
}


struct TrophyCircleView_Previews: PreviewProvider {
    static var previews: some View {
        TrophyCircleView(hasCaption: true, text: "Sweets", numberOnNumber: "6/10", emojiIcon: "🍫", progressFrom0to1: 0.6)
    }
}
