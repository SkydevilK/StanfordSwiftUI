//
//  ContentView.swift
//  Memorize
//
//  Created by SkydevilK on 2021/08/22.
//

import SwiftUI

struct ContentView: View {
    var emojis =
        ["π", "π₯", "π", "β½οΈ", "β³οΈ", "π₯", "π", "πͺ",
         "π", "π", "π", "π", "π", "π", "π", "π",
         "βοΈ", "π±", "π²", "π»", "β¨οΈ", "π₯", "π¨", "π§"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                // μ§μ° μν κ·Έλ¦¬λ λ·°(νμν  λ κΉμ§ ν­λͺ©μ μμ± μν¨)
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
    
    // Stateλ Databindingμ© κ°μ΄ μμ λλ©΄ Destroyed νκ³  λ€μ Recreate ν¨
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
