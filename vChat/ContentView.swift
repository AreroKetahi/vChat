//
//  ContentView.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var navigationTitle = "ContactList.OriginTitle"
    @State var uiColor = StoragedVars().uiColor
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ChatList(friendList: friendList, uiColor: $uiColor, navigationTitle: $navigationTitle)
                    .tabItem {
                        Label("Content.Chat",systemImage: "message")
                    }
                    .tag(0)
                
                ContactList(uiColor: $uiColor, navigationTitle: $navigationTitle)
                    .tabItem {
                        Label("Content.Contacts",systemImage: "person.2.crop.square.stack")
                    }
                    .tag(1)
                
                PreferenceList(thisSelf: selfPerson, uiColor: $uiColor, navigationTitle: $navigationTitle)
                    .tabItem {
                        Label("Content.Preference", systemImage: "gear")
                    }
                    .tag(2)
            }
            .accentColor(uiColor)
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.locale, .init(identifier: "ar"))
//            .environment(\.layoutDirection, .rightToLeft)
    }
}
