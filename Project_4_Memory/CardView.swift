//
//  CardView.swift
//  Project_4_Memory
//
//  Created by Muskan Mankikar on 3/22/24.
//

import SwiftUI

struct Card: Equatable {
    var id: Int
    var picture: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    static let mockedCards1 = [
            Card(id: 0, picture: "🦕"),
            Card(id: 1, picture: "🐢"),
            Card(id: 2, picture: "🦔"),
            Card(id: 3, picture: "🦕"),
            Card(id: 4, picture: "🐢"),
            Card(id: 5, picture: "🦔"),
        ]
    static let mockedCards2 = [
            Card(id: 0, picture: "🐢"),
            Card(id: 1, picture: "🦔"),
            Card(id: 2, picture: "🦔"),
            Card(id: 3, picture: "🦕"),
            Card(id: 4, picture: "🐢"),
            Card(id: 5, picture: "🦕"),
        ]
    static let mockedCards3 = [
            Card(id: 0, picture: "🦔"),
            Card(id: 1, picture: "🐢"),
            Card(id: 2, picture: "🦕"),
            Card(id: 3, picture: "🦕"),
            Card(id: 4, picture: "🐢"),
            Card(id: 5, picture: "🦔"),
        ]
    static let mockedCards4 = [
            Card(id: 0, picture: "🦔"),
            Card(id: 1, picture: "🦕"),
            Card(id: 2, picture: "🐢"),
            Card(id: 3, picture: "🐢"),
            Card(id: 4, picture: "🦕"),
            Card(id: 5, picture: "🦔"),
        ]
}

struct CardView: View {
    @Binding var card: Card
    var onClicked: (() -> Void)?
    @State private var isShowingPicture = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .fill(card.isMatched ? .white : Color(red: 1, green: 0.95, blue: 0.87))
                .shadow(color: card.isMatched ? .white :.black, radius: 4, x: -2, y: 2)
            VStack(spacing: 20) {
                if(!card.isMatched) {
                    Text(card.isFaceUp ? card.picture : "")
                        .bold()
                        .font(.largeTitle)
                }
            }
        }
        .frame(width: 100, height: 180)
        .onTapGesture {
            isShowingPicture.toggle()
            card.isFaceUp = true
            print(card.isFaceUp)
            onClicked?()
        }
    }
}


struct CardView_Previews: PreviewProvider {
    @State static var card = Card(id: 0, picture: "🦕")
    
    static var previews: some View {
        CardView(card: $card)
    }
}

//#Preview {
//    CardView(card: `$`(Card(id: 0, picture: "🦕")))
//}
