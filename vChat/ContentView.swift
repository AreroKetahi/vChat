//
//  ContentView.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                ChatList()
                    .tabItem {
                        Label("Chat",systemImage: "message")
                    }.tag(1)
                
                Text("Friends Page")
                    .tabItem {
                        Label("Friends",systemImage: "person.3")
                    }.tag(2)
                
                Text("Preference Page")
                    .tabItem {
                        Label("Preference", systemImage: "gear")
                    }.tag(3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
