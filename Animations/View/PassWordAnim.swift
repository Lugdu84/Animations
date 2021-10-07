//
//  PassWordAnim.swift
//  Animations
//
//  Created by David Grammatico on 07/10/2021.
//

import SwiftUI

struct PassWordAnim: View {
    @State var open = false
    var body: some View {
        ZStack {
            VStack {
                Text("Coucou je suis Ouvert")
                Button {
                    withAnimation(.linear(duration: 0.5)) {
                        open.toggle()
                    }
                } label: {
                    Text("Refermez moi !")
                }
            }.transition(.opacity)
            if !open {
                LockedScreen(open: $open)
            }
        }
    }
}

struct PassWordAnim_Previews: PreviewProvider {
    static var previews: some View {
        PassWordAnim()
    }
}

struct LockedScreen: View {
    @Binding var open: Bool
    @State var password = ""
    @State var wrong = " "
    let size = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Image("header")
                .resizable()
                .frame(width: size.width, height: size.height)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 8, opaque: true)
            VStack {
                Spacer()
                Image("header")
                    .resizable()
                    .frame(width: size.width / 3, height: size.width / 3)
                    .clipShape(Circle())
                Text("Entrez votre code")
                    .font(.title)
                    .italic()
                HStack (spacing: 25){
                    ForEach(0..<4) {index in
                        CirclePasswordView(position: index, password: $password)
                    }
                }
                Text(wrong)
                    .foregroundColor(.red)
                    .font(.title)
                Spacer()
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), content: {
                    ForEach(1..<13) { x in
                        if x == 11 {
                            NumberButton(value: "0", password: $password)
                        }
                        else if x == 10 || x == 12 {
                            Spacer()
                        }
                        else {
                            NumberButton(value: "\(x)", password: $password)
                        }
                    }
                })
                Spacer()
                HStack {
                    Button {
                        
                    } label: {
                        Text("Urgences")
                    }
                    Spacer()
                    Button("Annuler") {
                        password = ""
                    }

                }.padding()
            }
        }.onChange(of: password) { newValue in
            if password.count == 4 {
                if password == "1234" {
                    withAnimation(.linear(duration: 1)) {
                        open = true
                        wrong = " "
                    }
                } else {
                    wrong = "Mauvais code"
                    removeAll()
                }
            } else {
                wrong = " "
            }
        }
    }
    
    func removeAll() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            password = ""
        }
    }
}

struct CirclePasswordView: View {
    var position: Int
    @Binding var password: String
    var body: some View {
        ZStack {
            if password.count > position {
                Circle()
                    .fill(.mint)
                    .frame(width: 25, height: 25)
            }
            else {
                Circle()
                   .stroke(lineWidth: 2)
                   .frame(width: 25, height: 25)
            }
        }.animation(.linear(duration: 0.5), value: password)
    }
}

struct NumberButton: View {
    var value: String
    @Binding var password: String
    @State var color = Color.primary
    var body: some View {
        Button {
            password = password + value
            color = .mint
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                color = .primary
            }
        } label: {
            Text(value)
                .font(.largeTitle)
                .foregroundColor(color)
                .frame(width: 75, height: 75)
                .overlay(Circle().stroke(color, lineWidth: 2))
        }.animation(.easeIn(duration: 0.25), value: color)

    }
}
