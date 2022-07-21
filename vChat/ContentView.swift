//
//  ContentView.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//  THIS IS A TEST

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var navigationTitle = ["Chat","Contacts","Preference"]
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ChatList(friendList: friendList)
                    .tabItem {
                        Label("Chat",systemImage: "message")
                    }
                    .tag(0)
                
                ContactList()
                    .tabItem {
                        Label("Contacts",systemImage: "person.2.crop.square.stack")
                    }
                    .tag(1)
                
                Text("Preference Page")
                    .tabItem {
                        Label("Preference", systemImage: "gear")
                    }
                    .tag(2)
            }
            .navigationBarTitle(navigationTitle[selection])
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
