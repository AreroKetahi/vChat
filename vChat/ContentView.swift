//
//  ContentView.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Text("Chat Page")
                .tabItem {
                    Label("Chat",systemImage: "message")
                }.tag(1)
            
            Text("Friends Page")
                .tabItem {
                    Label("Friends",systemImage: "person.3")
                }.tag(2)
            
            Text("Perference Page")
                .tabItem {
                    Label("Perference", systemImage: "gear")
                }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
