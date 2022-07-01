//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatPage: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var inputMessage = ""
    @ObservedObject var objectsVars = VCEnvironmentObjects()
    
    @Namespace var locationPoint
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                ForEach(objectsVars.messages){ messages in
                    if messages.isReceive {
                        MessagePopReceive(messages: messages)
                    } else {
                        MessagePopSent(messages: messages)
                    }
                }
                Spacer().frame(height: 10)
                Rectangle() // Location Point
                    .foregroundColor(Color(.displayP3, red: 0.5, green: 0.5, blue: 0.5, opacity: 0))
                    .id(locationPoint)
                Spacer()
            }
            HStack {
                TextField("Messages", text: $inputMessage, onCommit: vDidSendMessage)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundColor(
                            colorScheme == .light ?
                            Color(.displayP3, red: 0.9, green: 0.9, blue: 0.9, opacity: 1) :
                                Color(.displayP3, red: 0.2, green: 0.2, blue: 0.2, opacity: 1)
                        )
                        .frame(height: 40)
                    )
                Button("Send") {
                    withAnimation {
                        proxy.scrollTo(locationPoint, anchor: .bottom)
                    }
                    vDidSendMessage()

                }
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .foregroundColor(.blue)
                    .frame(height: 40)
                )
            } // Message Pop
            .padding(.horizontal)
        }
    }
    
    func vDidSendMessage() {
        if inputMessage != "" {
            objectsVars.messages.append(VCMessage(messageContent: inputMessage, isReceive: false))
            inputMessage = ""
        }
    }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatPage(objectsVars: VCEnvironmentObjects())
                .environmentObject(VCEnvironmentObjects())
            ChatPage(objectsVars: VCEnvironmentObjects())
                .environmentObject(VCEnvironmentObjects())
                .preferredColorScheme(.dark)
        }
    }
}
