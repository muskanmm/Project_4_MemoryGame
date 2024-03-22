//
//  ContentView.swift
//  Project_4_Memory
//
//  Created by Muskan Mankikar on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = Card.mockedCards1
    @State private var numCardsFlipped: [(Card, Int)] = []
    
    let data = (0...5).map { $0 }

    let columns = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 90))
    ]
    var body: some View {
        VStack {
            Button("Reset") {
                let num = Int.random(in: 1...4)
                switch num {
                case 1:
                    cards = Card.mockedCards1
                case 2:
                    cards = Card.mockedCards2
                case 3:
                    cards = Card.mockedCards3
                case 4:
                    cards = Card.mockedCards4
                default:
                    cards = Card.mockedCards3
                }
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
            .background(.blue)
            .foregroundColor(.white)
        .cornerRadius(20)
        }
        .padding(.top, 30)
        
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(data, id: \.self) { item in
                    CardView(card: self.$cards[item], onClicked: {
                        numCardsFlipped.append((cards[item], item))
                        cards[item].isFaceUp = true
                        print(numCardsFlipped.count)
                        print(cards[item].isFaceUp)
                        
//                        if(numCardsFlipped.count > 1) {
//                            numCardsFlipped.removeAll()
//                        } 
                        if numCardsFlipped.count % 2 == 0 {
                            let _ = print("hi")
                            let isMatch = compareMatch(card1: numCardsFlipped[0].0, card2: numCardsFlipped[1].0)
                //            let _ = numCardsFlipped.removeAll()
                            if isMatch {
                                cards[numCardsFlipped[0].1].isMatched = true
                                cards[numCardsFlipped[1].1].isMatched = true
                                print("is match = \(cards[numCardsFlipped[0].1].isMatched)")
                                numCardsFlipped.removeAll()
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {cards[numCardsFlipped[0].1].isFaceUp = false
                                    cards[numCardsFlipped[1].1].isFaceUp = false
                                    let _ =
                                    numCardsFlipped.removeAll()
                                }
                            }
//                            let _ = numCardsFlipped.remove(at: numCardsFlipped[0].1)
//                            let _ = numCardsFlipped.remove(at: numCardsFlipped[1].1)
                        }
                    })
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 600)
        .padding(.top, 50)
        
    }
    func compareMatch (card1:Card, card2:Card) -> Bool {
        return card1.picture == card2.picture
    }
    
}

#Preview {
    ContentView()
}
