//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatList: View {
    var friendList: [Person]
    
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
//        NavigationView {//Need to notes this code while compiling
        List(friendList) { friend in
            NavigationLink {
                ChatPage(friendImageName: friend.imageName, selfImageName: selfImageName, objectsVars: VCEnvironmentObjects())
                    .navigationBarTitle(friend.remark ?? friend.nickname)
            } label: {
                PersonLabelComponent(imageName: friend.imageName, nickname: friend.remark ?? friend.nickname)
                .overlay(Circle()
                    .frame(width: 12, height: 12)
                    .position(x: 47, y: 3)
                    .foregroundColor(.blue)
                    .shadow(color: .blue, radius: 2)
                ) //Notification Point
            }
        }
//        .navigationTitle("Chat")
        .navigationBarTitleDisplayMode(.inline)
//      } //Need to notes this code while compiling
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatList(friendList: friendList)
            ChatList(friendList: friendList)
                .preferredColorScheme(.dark)
            
        }
    }
}
