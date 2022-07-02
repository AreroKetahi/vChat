//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatList: View {
    var friendList: [Person]
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
//        NavigationView {//Need to notes this code while compiling
        List(friendList) { friend in
            NavigationLink {
                ChatPage(friendImageName: friend.imageName, objectsVars: VCEnvironmentObjects())
                    .navigationBarTitle("Zhang San")
            } label: {
                HStack {
                    PersonHeadImage(imageName: friend.imageName)

                    Text(friend.nickname)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .shadow(color: Color(
                            colorScheme == .light ?
                            CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3) :
                                CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.3)
                        ),
                                radius: 1, x: 0, y: 0)
                }
                .overlay(Circle()
                    .frame(width: 12, height: 12)
                    .position(x: 47, y: 3)
                    .foregroundColor(.blue)
                    .shadow(color: .blue, radius: 2)
                ) //Notification Point
            }
        }
        .navigationTitle("Chat")
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
