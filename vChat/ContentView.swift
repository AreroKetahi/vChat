//
//  ContentView.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//  THIS IS A TEST

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                ChatList(friendList: friendList)
                    .tabItem {
                        Label("Chat",systemImage: "message")
                    }
                
                Text("Contacts Page")
                    .tabItem {
                        Label("Contacts",systemImage: "person.2.crop.square.stack")
                    }
                
                Text("Preference Page")
                    .tabItem {
                        Label("Preference", systemImage: "gear")
                    }
                Text("Me")
                    .tabItem {
                        Label("Me", systemImage: "gear")
                    }
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
