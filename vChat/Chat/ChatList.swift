//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatList: View {
    var body: some View {
//        NavigationView {//Need to notes this code while compiling
            List {
                NavigationLink {
                    ChatPage()
                } label: {
                    HStack {
                    Image("TestImage")
                    
                        .resizable()
                        .frame(width: 49, height: 49)
                        .cornerRadius(8)
                        .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)),
                                radius: 3, x: 0, y: 0)

                    Text("Zhang San")
                        .foregroundColor(.black)
                        .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)),
                                radius: 1, x: 0, y: 0)
                    }
//                    .overlay(Circle().frame(width: 12, height: 12).position(x: 47, y: 3).foregroundColor(.blue).shadow(color: .blue, radius: 2)) //Notification Point
                    
                }
            }
            .navigationTitle("Chat")
            .navigationBarTitleDisplayMode(.inline)
//        } //Need to notes this code while compiling
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
