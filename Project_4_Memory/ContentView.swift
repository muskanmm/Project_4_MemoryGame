//
//  ContentView.swift
//  Project_4_Memory
//
//  Created by Muskan Mankikar on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = Card.mockedCards
    
    let data = (0...5).map { $0 }

    let columns = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(data, id: \.self) { item in
                    CardView(card: cards[item])
//                            Text(item)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 600)
        .padding(.top, 100)
    }
}

#Preview {
    ContentView()
}
