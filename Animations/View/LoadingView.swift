//
//  LoadingView.swift
//  Animations
//
//  Created by David Grammatico on 24/09/2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        AnimatedFrame()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            //.background(Color.green)
            .offset(x: 50, y: 50)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

struct AnimatedFrame: View {
    let colors: [Color] = [.red, .blue, .yellow, .green, .orange, .pink, .purple]
    var body: some View {
        GeometryReader { geo in
            ForEach(0..<colors.count) {index in
                AnimatedCircle(index: index, color: colors[index], width: geo.size.width, height: geo.size.height)            }
        }
    }
    
}

struct AnimatedCircle: View {
    var index: Int
    var color: Color
    let width: CGFloat
    let height: CGFloat
    @State var scale: CGFloat = 1.0
    @State var rotation: Double = -90
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: width / 5, height: width / 5)
            .scaleEffect(scale)
            .offset(x: width / 5 + 20, y: (width * 0.25) / 3 - (height * 0.25))
            .rotationEffect(.degrees(rotation))
            .onAppear() {
                self.rotation = -90
                self.scale = (5 - CGFloat(index)) / 5
                withAnimation(anim(index)) {
                    self.rotation = 360 - 90
                    self.scale = (1 + CGFloat(index)) / 5
                }
            }
        
    }
    
    func anim(_ index: Int) -> Animation {
        return Animation
            .timingCurve(0.5, 0.1 + Double(index) / 10, 0.5, 1, duration: 1)
            .repeatForever(autoreverses: false)
    }
}
