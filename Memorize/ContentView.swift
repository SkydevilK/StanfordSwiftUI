//
//  ContentView.swift
//  Memorize
//
//  Created by SkydevilK on 2021/08/22.
//

import SwiftUI

struct ContentView: View {
    var emojis =
        ["🏀", "🥎", "🏐", "⚽️", "⛳️", "🥊", "🏑", "🪁",
         "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚒",
         "⌚️", "📱", "📲", "💻", "⌨️", "🖥", "🖨", "🚧"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                // 지연 수평 그리드 뷰(필요할 때 까지 항목을 생성 안함)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    
    // State는 Databinding용 값이 수정되면 Destroyed 하고 다시 Recreate 함
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
    }
}
