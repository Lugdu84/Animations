//
//  SwipeToUnlockView.swift
//  Animations
//
//  Created by David Grammatico on 05/10/2021.
//

import SwiftUI

struct SwipeToUnlockView: View {
    @State var isOpen = false
    var body: some View {
        ZStack {
            HomeView(isOpen: $isOpen)
                .transition(.opacity)
            if !isOpen {
                LockScreen(isOpen: $isOpen)
                    .transition(.scale)
            }
        }
    }
}

struct SwipeToUnlockView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToUnlockView()
    }
}

struct HomeView: View {
    @Binding var isOpen: Bool
    var body: some View {
        Button {
            withAnimation(.linear(duration: 0.5)) {
                isOpen.toggle()
            }
        } label: {
            Image(systemName: "power")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
        }
    }
}

struct LockScreen: View {
    @Binding var isOpen: Bool
    let screen = UIScreen.main.bounds
    @State var offset: CGFloat = 0
    var minValue : CGFloat {
    return -(screen.width * 0.9 / 2) + (screen.height / 10 / 2)
    }
    var maxValue: CGFloat {
        return (screen.width * 0.9 / 2) - (screen.height / 10 / 2)
    }
    var body: some View {
        ZStack {
            Capsule()
                .fill(.white.opacity(0.25))
                .frame(width: screen.width * 0.9, height: screen.height / 10)
            Text("Glisser pour ouvrir")
                .font(.title)
                .foregroundColor(.gray)
                .bold()
                .offset(x: screen.height / 10 / 2, y: 0)
            Image(systemName: "power")
                .resizable()
                .scaledToFill()
                .frame(width: screen.height / 10 * 0.5, height: screen.height / 10 * 0.5)
                .padding()
                .foregroundColor(.red)
                .background(Color.gray)
                .clipShape(Circle())
                .offset(x: offset, y: 0)
                .gesture(DragGesture().onChanged({ change in
                    let newPosition = change.location.x
                    if newPosition > minValue && newPosition < maxValue {
                        offset = newPosition
                    }
                }).onEnded(endGesture(value:)))
        }
        .frame(width: screen.width, height: screen.height)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
        .onAppear {
            offset = minValue
        }
    }
    
    func endGesture(value: DragGesture.Value) {
        let new = value.location.x
        if new > maxValue * 0.75 {
            withAnimation(.linear(duration: 0.5)) {
                isOpen = true
            }
        } else {
            withAnimation(.linear(duration: 0.3)) {
                offset = minValue
            }
        }
    }
}
