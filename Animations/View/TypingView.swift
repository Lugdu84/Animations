//
//  TypingView.swift
//  Animations
//
//  Created by David Grammatico on 18/08/2021.
//

import SwiftUI

struct TypingView: View {
    @State var isTyping = true
    var body: some View {
        VStack {
            if isTyping {
                BodyView()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
                    .background(Color.gray.opacity(0.33))
                    .cornerRadius(10)
                    .transition(.scale)
            }
            Button(action: {
                withAnimation(.linear(duration: 0.6)) {
                    self.isTyping.toggle()
                }
                
            }, label: {
                Text(isTyping ? "Arrêter" : "Commencer")
            })
        }
        
    }
}

struct TypingView_Previews: PreviewProvider {
    static var previews: some View {
        TypingView()
    }
}

struct BodyView: View {
    var count = 3
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<count) {index in
                MyCircle(index: index, count: count)
            }
        }
    }
}


struct MyCircle: View {
    @State var big = true
    var duration:Double = 0.5
    var index: Int
    var count: Int
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 15)
            .scaleEffect(big ? 1 : 0.5)
            //.offset(x: 0, y: big ? 0 : -5)
            .onAppear() {
                withAnimation(animFor(index)) {
                    self.big.toggle()
                }
            }
    }
    
    func animFor(_ index: Int) -> Animation {
        return Animation.easeIn(duration: duration)
            .repeatForever()
            .delay((Double(index) / Double(count)) * duration)
    }
}
