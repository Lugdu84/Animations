//
//  LikeTwitter.swift
//  Animations
//
//  Created by David Grammatico on 13/08/2021.
//

import SwiftUI

struct LikeTwitter: View {
    @State var isAnimationEnded = false
    @State var scale: CGFloat = 1
    var body: some View {
        ZStack {
            Text("Contenu de mon application")
            if !isAnimationEnded {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .transition(.opacity)
                Image("codabee")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaleEffect(scale)
                    .transition(.opacity)
            }
            
            
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5)) {
                    self.scale = 3
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.linear(duration: 0.5)) {
                    self.isAnimationEnded.toggle()
                }
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct LikeTwitter_Previews: PreviewProvider {
    static var previews: some View {
        LikeTwitter()
    }
}
