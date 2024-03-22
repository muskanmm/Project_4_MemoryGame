//
//  CardView.swift
//  Project_4_Memory
//
//  Created by Muskan Mankikar on 3/22/24.
//

import SwiftUI

struct Card: Equatable {
    let picture: String
    static let mockedCards = [
            Card(picture: "🦕"),
            Card(picture: "🐢"),
            Card(picture: "🦔"),
            Card(picture: "🦕"),
            Card(picture: "🐢"),
            Card(picture: "🦔"),
        ]
}

struct CardView: View {
    let card: Card
    @State private var isShowingPicture = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color(red: 1, green: 0.95, blue: 0.87))
                .shadow(color: .black, radius: 4, x: -2, y: 2)
            VStack(spacing: 20) {
                Text(isShowingPicture ? card.picture : "")
                    .bold()
                    .font(.largeTitle)
            }
        }
        .frame(width: 100, height: 180)
        .onTapGesture {
            isShowingPicture.toggle()
        }
    }
}

#Preview {
    CardView(card: Card(picture: "🦕"))
}
