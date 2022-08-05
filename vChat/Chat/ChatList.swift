//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatList: View {
    var friendList: [Person]
    
    @Binding var uiColor: Color
    @Binding var navigationTitle: String
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
//        NavigationView {//Need to notes this code while compiling
        List(friendList) { friend in
            NavigationLink {
                ChatPage(friendImageName: friend.imageName, selfImageName: selfImageName, objectsVars: VCEnvironmentObjects(), uiColor: $uiColor)
                    .navigationBarTitle(friend.remark ?? friend.nickname)
            } label: {
                PersonLabelComponent(imageName: friend.imageName, nickname: friend.remark ?? friend.nickname)
                .overlay(Circle()
                    .frame(width: 12, height: 12)
                    .position(x: 47, y: 3)
                    .foregroundColor(uiColor)
                    .shadow(color: uiColor, radius: 2)
                ) //Notification Point
            }
        }
        .onAppear {
            navigationTitle = NSLocalizedString("ChatList.Chat", comment: "super:ChatList")
        }
//        .navigationTitle("Chat")
        .navigationBarTitleDisplayMode(.inline)
//      } //Need to notes this code while compiling
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatList(friendList: friendList, uiColor: .constant(.blue), navigationTitle: .constant("Chat"))
        }
    }
}
