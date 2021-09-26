//
//  ContentView.swift
//  Animations
//
//  Created by David Grammatico on 23/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State var isOpen = false
    @State var color:Color = .primary
    let screenSize = UIScreen.main.bounds
    var menuWidth: CGFloat {
        return screenSize.width / 2
    }
    var basePosition: CGFloat {
        return -(screenSize.width - menuWidth) / 2
    }
    
    var closePosition: CGFloat {
        return basePosition - menuWidth
    }
    var body: some View {
        NavigationView {
            ZStack {
                AnimationListView(color: color)
                    //.offset(x: isOpen ? menuWidth : 0, y: 0)
                SideMenuView(color: $color, isOpen: $isOpen)
                    .frame(width: menuWidth, height: screenSize.height)
                    .background(Color.white)
                    .offset(x: isOpen ? basePosition : closePosition, y: 0)
                    //.shadow(color: .gray.opacity(0.25), radius: 2, x: 2, y: 2)
            }
            .navigationTitle(isOpen ? "" : "Les Animations")
            .navigationBarItems(leading: Button(action: {
                withAnimation(.linear(duration: 0.3)) {
                    self.isOpen.toggle()
                }
            }, label: {
                Image(systemName: "cross.circle.fill")
                    .rotationEffect(.degrees(isOpen ? 45 : 0))
                    
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
