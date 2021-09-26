//
//  SideMenuView.swift
//  Animations
//
//  Created by David Grammatico on 27/07/2021.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var color: Color
    @Binding var isOpen: Bool
    
    var colors: [Color] = [
        .red, .purple, .orange, .green, .blue
    ]
    
    var body: some View {
        List(0..<colors.count + 1, rowContent: { index in
            if (index == 0) {
                Image("header")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
            }
            else {
                Button(action: {
                    withAnimation {
                        self.color = colors[index - 1]
                        self.isOpen.toggle()
                    }
                    
                }, label: {
                    HStack {
                        Circle()
                            .fill(colors[index - 1])
                            .frame(width: 25, height: 25)
                    }
                })
            }
        })
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(color: .constant(.primary), isOpen: .constant(true))
    }
}
