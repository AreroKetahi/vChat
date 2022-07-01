//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatPage: View {
    @State private var inputMessage = ""
    @ObservedObject var objectsVars = EnviromentObjects()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(objectsVars.messages){ messages in
                    if messages.isReceive {
                        HStack {
                            Image("TestImage")
                                .resizable()
                                .frame(width: 49, height: 49)
                                .cornerRadius(8)
                                .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)),
                                        radius: 3, x: 0, y: 0)
                            Text(messages.messageContent)
                                .padding()
                                .background(Rectangle().foregroundColor(Color(cgColor: CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))))
                                .frame(height: 49)
                                .cornerRadius(8)
                                .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)),
                                        radius: 5, x: 0, y: 0)
                            Spacer()
                        } // Friends Messages
                    } else {
                        HStack {
                            Spacer()
                            Text(messages.messageContent)
                                .foregroundColor(.white)
                                .padding()
                                .background(Rectangle().foregroundColor(.blue))
                                .frame(height: 49)
                                .cornerRadius(8)
                                .shadow(color: Color(.displayP3, red: 0/255, green: 122/255, blue: 255/255, opacity: 0.5),
                                        radius: 5, x: 0, y: 0)
                            Image("EmptyHeadImage")
                                .resizable()
                                .frame(width: 49, height: 49)
                                .cornerRadius(8)
                                .shadow(color: Color(CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)),
                                        radius: 3, x: 0, y: 0)
                        } // Self Messages
                    }
                }
                Spacer()
            }
            HStack {
                TextField("Messages", text: $inputMessage, onCommit: vDidSendMessage)
                    .padding()
                    .background(Rectangle().foregroundColor(Color(.displayP3, red: 0.9, green: 0.9, blue: 0.9, opacity: 1)))
                    .frame(height: 40)
                    .cornerRadius(8)
                Button("Send") {
                    vDidSendMessage()
                }
                .foregroundColor(.white)
                .padding()
                .background(Rectangle()
                    .foregroundColor(.blue))
                .frame(height: 40)
                .cornerRadius(8)
            } // Message Pop
        }
        .padding([.leading, .bottom, .trailing])
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
        ChatPage(objectsVars: EnviromentObjects())
            .environmentObject(EnviromentObjects())
    }
}
