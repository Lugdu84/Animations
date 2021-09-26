//
//  CounterView.swift
//  Animations
//
//  Created by David Grammatico on 13/09/2021.
//

import SwiftUI

struct CounterView: View {
    @State var isPlaying = false
    @State var timeChosen: CGFloat = 1.0
    @State var timeSpent: CGFloat = 0.25
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let screenSize = UIScreen.main.bounds
    let lineWidth: CGFloat = 25
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Mon Chrono")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: screenSize.width * 0.75, height: screenSize.width * 0.75)
                    .overlay(Circle().stroke(Color.purple.opacity(0.2), lineWidth: lineWidth))
                Circle()
                    .trim(from: 0, to: timeSpent / timeChosen)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .frame(width: screenSize.width * 0.75, height: screenSize.width * 0.75)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.linear(duration: 0.5), value: timeSpent)
                Text(setupTime())
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
            })
            Spacer()
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30, content: {
                ButtonCounter(type: .play, isPlaying: $isPlaying, timerSpent: $timeSpent)
                ButtonCounter(type: .stop, isPlaying: $isPlaying, timerSpent: $timeSpent)
            })
            Slider(value: $timeChosen, in: 0...100)
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding()
        }).onReceive(timer, perform: { time in
            if isPlaying {
                if timeChosen > timeSpent {
                    timeSpent += 0.1
                }
                else {
                    isPlaying = false
                }
            }
        })
    }
    func setupTime() -> String {
        let timeValue = timeChosen - timeSpent
        let minute = Int(timeValue) / 60
        let seconds = Int(timeValue) % 60
        let secondsBeautify = seconds < 10 ? "0\(seconds)" : String(seconds)
        return "\(minute) : " + secondsBeautify
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}

struct ButtonCounter: View {
    var type: ButtonType
    @Binding var isPlaying: Bool
    @Binding var timerSpent: CGFloat
    var body: some View {
        Button(action: {
            if type == .stop {
                isPlaying = false
                timerSpent = 0
            }
            else {
                isPlaying.toggle()
            }
        }, label: {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Image(systemName: type == .stop ? "arrow.clockwise" : isPlaying ? "pause.fill" : "play.fill")
                Text(type == .stop ? "Redémarrer" : isPlaying ? "Pause" : "Play")
            })
        })
        .frame(width: UIScreen.main.bounds.width / 3, height: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(25)
    }
}

enum ButtonType {
    case play
    case stop
}
