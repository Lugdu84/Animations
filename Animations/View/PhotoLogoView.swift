//
//  PhotoLogoView.swift
//  Animations
//
//  Created by David Grammatico on 05/10/2021.
//

import SwiftUI

struct PhotoLogoView: View {
    @State var animation = false
    var petal: [Double: Color] = [
        0: .blue,
        180: .orange,
        90: .pink,
        -90: .gray,
        45: .purple,
        -45: .teal,
        135: .red,
        -135: .yellow
    ]
    var body: some View {
        VStack {
            Text("Appuie sur l'icone si tu oses !")
            Spacer()
            ZStack {
                ForEach(petal.keys.sorted(), id: \.self) {p in
                    PetalView(
                        color: petal[p]!,
                        angle: p + (animation ? 1080 : 0),
                        height: animation ? 90 : 70)
                }
                .onTapGesture {
                    animation.toggle()
                }.animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5), value: animation)
            }
            Spacer()
        }
        
    }
}

struct PhotoLogoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLogoView()
    }
}

struct PetalView: View {
    var color: Color
    var angle: Double
    var height: Double
    
    var body: some View {
        Capsule()
            .foregroundColor(color)
            .frame(width: 50, height: height, alignment: .center)
            .offset(x: 0, y: (height / 2) + 3)
            .rotationEffect(.degrees(angle))
            .opacity(0.75)
    }
}
