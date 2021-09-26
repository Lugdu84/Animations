//
//  AnimationView.swift
//  Animations
//
//  Created by David Grammatico on 23/07/2021.
//

import SwiftUI

struct AnimationView: View {
    @State var color: Color = .purple
    @State var radius: CGFloat = 25
    @State var offsetY: CGFloat = 0
    @State var offsetX: CGFloat = 0
    @State var size: CGFloat = 150
    @State var shadowColor: Color = .gray
    @State var isCenter = true
    @State var shadowX: CGFloat = 5
    var body: some View {
        VStack {
            HStack {
                if !isCenter {
                    Spacer()
                }
                Rectangle()
                    .frame(width: size, height: size)
                    .foregroundColor(color)
                    .cornerRadius(radius)
                    .offset(x: offsetX, y: offsetY)
                    .shadow(color: shadowColor, radius: 3, x: shadowX, y: 3)
                    .animation(.linear(duration: 1), value: color)
                    .animation(.spring(response: 0.4, dampingFraction: 0.2, blendDuration: 0.5), value: radius)
            }
            Spacer()
            HStack(spacing: 30) {
                Button("Color") {
                    self.color = (color == .purple) ? .green : .purple
                }
                Button("Radius") {
                    self.radius = (radius == 25) ? 150 : 25
                }
                Button("Shadow") {
                    withAnimation(.easeIn(duration: 2)) {
                        self.shadowColor = (shadowColor == .gray) ? .yellow : .gray
                    }
                }
            }
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30, content: {
                Button(action: {
                    withAnimation {
                        //self.offsetY = (offsetY == 0) ? 150 : 0
                        self.isCenter.toggle()
                    }
                }, label: {
                    Text("Center")
                })
                Button("Change offset and grow") {
                    withAnimation {
                        self.size = (size == 150) ? 250 : 150
                        self.offsetY = (offsetY == 0) ? 200 : 0
                        self.offsetX = (offsetX == 0) ? 50 : 0
                    }
                    
                }
                
            })
        }
        .onAppear(perform: {
            withAnimation(animateShadow()) {
                self.shadowX = (shadowX == 5) ? -5 : 5
            }
        })
    }
    func animateShadow() -> Animation {
        let animation = Animation.easeInOut(duration: 4)
            .repeatForever()
        return animation
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
