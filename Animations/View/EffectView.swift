//
//  EffectView.swift
//  Animations
//
//  Created by David Grammatico on 25/07/2021.
//

import SwiftUI

struct EffectView: View {
    @State var scale: CGFloat = 1
    @State var degrees: Double = 0
    var body: some View {
        VStack(spacing: 30) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .scaleEffect(scale)
            Button(action: {
                withAnimation(.easeIn(duration: 2)) {
                    scale = scale == 1 ? 2 : 1
                }
                
            }, label: {
                Image(systemName: "scale.3d")
            })
            Image(systemName: "house.fill")
                .scaleEffect(3)
                .rotationEffect(.degrees(degrees))
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 2), value: degrees)
            Slider(value: $degrees,
                   in: 0...360) {
                Text("Value : \(degrees)")
            }
            Text("Valeur : \(Int(degrees)) °")
                
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView()
    }
}
