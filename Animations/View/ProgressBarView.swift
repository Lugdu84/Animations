//
//  ProgressBarView.swift
//  Animations
//
//  Created by David Grammatico on 01/09/2021.
//

import SwiftUI

struct ProgressBarView: View {
    let width: CGFloat = 250
    let height: CGFloat = 50
    let cornerRadius: CGFloat = 10
    @State var percent: CGFloat  = 0
    @State var percentFromTimer: CGFloat = 0
    @State var timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray.opacity(0.25))
                    .cornerRadius(cornerRadius)
                Rectangle()
                    .frame(width: width * (percent / 100), height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.purple)
                    .cornerRadius(cornerRadius)
            }.onAppear {
                withAnimation(.linear(duration: 4)) {
                    self.percent = 100
                }
            }
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray.opacity(0.25))
                    .cornerRadius(cornerRadius)
                Rectangle()
                    .frame(width: width * (percentFromTimer / 100), height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.purple)
                    .cornerRadius(cornerRadius)
                    .animation(.linear, value: percentFromTimer)
                Text("\(Int(percentFromTimer)) %")
                    .frame(width: width, height: height)
            }.onReceive(timer, perform: { _ in
                if percentFromTimer < 100 {
                    percentFromTimer += 1
                }
                
            })
        }
        
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
