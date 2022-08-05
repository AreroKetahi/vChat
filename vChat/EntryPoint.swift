//
//  EntryPoint.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/5.
//

import SwiftUI

struct EntryPoint: View {
    @State private var selection = 0
    @State private var navigationTitle = "ContactList.OriginTitle"
    @State private var uiColor = StoragedVars().uiColor
    @Binding var isAppLocked: Bool
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ChatList(friendList: friendList, uiColor: $uiColor, navigationTitle: $navigationTitle)
                    .tabItem {
                        Label("Entry.Chat",systemImage: "message")
                    }
                    .tag(0)
                
                ContactList(uiColor: $uiColor, navigationTitle: $navigationTitle)
                    .tabItem {
                        Label("Entry.Contacts",systemImage: "person.2.crop.square.stack")
                    }
                    .tag(1)
                
                PreferenceList(thisSelf: selfPerson, uiColor: $uiColor, navigationTitle: $navigationTitle)
                    .tabItem {
                        Label("Entry.Preference", systemImage: "gear")
                    }
                    .tag(2)
            }
            .accentColor(uiColor)
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: HStack{
                Button {
                    withAnimation(.easeInOut) {
                        isAppLocked = true
                    }
                } label: {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                }
            })
            .navigationBarItems(trailing: HStack{
                Text(String(selfPerson.uid))
                    .font(.system(size: 18, weight: .ultraLight, design: .monospaced))
                    .foregroundColor(.gray)
            })
        }
    }
}

struct EntryPoint_Previews: PreviewProvider {
    static var previews: some View {
        EntryPoint(isAppLocked: .constant(false))
    }
}
