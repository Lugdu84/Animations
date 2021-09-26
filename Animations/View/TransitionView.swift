//
//  TransitionView.swift
//  Animations
//
//  Created by David Grammatico on 23/07/2021.
//

import SwiftUI

struct TransitionView: View {
    @State var showText = true
    var body: some View {
        VStack {
            if showText {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).padding()
                    .transition(.offset(x: 300, y: 0))
            }
            Button(showText ? "Cacher" : "Montrer") {
                withAnimation {
                    self.showText.toggle()
                }
                
            }
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
