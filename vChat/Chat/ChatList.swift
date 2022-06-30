//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatList: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ChatPage()
                } label: {
                    Image("TestImage")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(3)
                        .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)),
                                radius: 3, x: 0, y: 0)
                    Text("Zhang San")
                        .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)),
                                radius: 3, x: 0, y: 0)
                }
            }
            .navigationTitle("Chat")
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
