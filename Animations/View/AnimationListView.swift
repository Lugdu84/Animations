//
//  AnimationListView.swift
//  Animations
//
//  Created by David Grammatico on 23/07/2021.
//

import SwiftUI

struct AnimationListView: View {
    var color:Color
    var body: some View {
        List {
            Section(header: Text("Modifications liées au SideMenu")) {
                Text("J'ai récupéré les infos du SideMenu")
                    .foregroundColor(color)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            Section(header: Text("Les basiques")) {
                NavigationLink(
                    destination: AnimationView(),
                    label: {
                        Text("Animation")
                    })
                NavigationLink(
                    destination: TransitionView(),
                    label: {
                        Text("Transition")
                    })
            }
            Section(header: Text("Animations courantes")) {
                NavigationLink(
                    destination: LikeTwitter(),
                    label: {
                        Text("Comme Twitter")
                    })
                NavigationLink(
                    destination: TypingView(),
                    label: {
                        Text("Anim écriture message")
                    })
                NavigationLink(
                    destination: ProgressBarView(),
                    label: {
                        Text("Progress Bar")
                    })
                NavigationLink(
                    destination: CounterView(),
                    label: {
                        Text("Counter")
                    })
                NavigationLink(
                    destination: LoadingView(),
                    label: {
                        Text("Loading View")
                    })
                NavigationLink(
                    destination: LoadingView(),
                    label: {
                        Text("Loading View")
                    })
            }
            Section(header: Text("Faire comme Apple")) {
                
            }
        }
        .listStyle(GroupedListStyle())
        
    }
}

struct AnimationListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationListView(color: .primary)
    }
}
