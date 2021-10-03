//
//  PopUpView.swift
//  Animations
//
//  Created by David Grammatico on 03/10/2021.
//

import SwiftUI

struct PopUpView: View {
    @State var show = false
    let middle = UIScreen.main.bounds.height / 2
    let popHeight:CGFloat = 200
    var body: some View {
        ZStack(
            alignment: .center) {
                Button {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)) {
                        show.toggle()
                    }
                    
                } label: {
                    Text(show ? "Cache moi !" : "Montre moi !")
                }
                PopUp(show: $show)
                    .frame(minHeight: popHeight, maxHeight: popHeight)
                    .offset(x: 0, y: show ? -popHeight : -middle - popHeight)
            }
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}

struct PopUp: View {
    @Binding var show: Bool
    var body: some View {
        VStack {
            Text("Mon PopUp")
                .font(.title)
                .padding()
            Text("Voici les informations supplémentaires de mon Pop Up")
                .multilineTextAlignment(.center)
                .padding()
        }
        .background(Color.blue.opacity(0.15))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
    }
}
