//
//  ChatPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/24.
//

import SwiftUI

struct ChatPage: View {
    var friendImageName: String?
    var selfImageName: String?
    
    @State private var inputMessage = ""
    @ObservedObject var objectsVars = VCEnvironmentObjects()
    @FocusState var focusPoint: FocusEnum?
    @State var errorCorrectionSpace = 0.0
    
    @Binding var uiColor: Color
    @Environment(\.colorScheme) private var colorScheme
    
    @Namespace var locationPoint
    @Namespace var ScrollViewReaderTag
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                ForEach(objectsVars.messages){ messages in
                    if messages.isReceive {
                        MessagePop(messages: messages, imageName: friendImageName, uiColor: $uiColor)
                    } else {
                        MessagePop(messages: messages, imageName: selfImageName, uiColor: $uiColor)
                    }
                }
                Spacer().frame(height: 10)
                Spacer().frame(height: 44) // Safe Area
                Spacer().frame(height: errorCorrectionSpace) //Error Correction Space
                Rectangle() // Location Point
                    .foregroundColor(Color(.displayP3, red: 0.5, green: 0.5, blue: 0.5, opacity: 0))
                    .id(locationPoint)
                Spacer()
            }
            .onAppear(perform: {proxy.scrollTo(locationPoint, anchor: .bottom)})
            .overlay(alignment: .bottom) {
                HStack {
                    TextField(
                        "ChatPage.Messages",
                        text: $inputMessage,
                        onEditingChanged: { _ in
                            withAnimation {
                                proxy.scrollTo(locationPoint, anchor: .bottom)
                            }
                        }
                    )
                    .submitLabel(.done)
                    .focused($focusPoint, equals: .messagePop)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundColor(
                            colorScheme == .light ?
                            Color(.displayP3, red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8) :
                                Color(.displayP3, red: 0.2, green: 0.2, blue: 0.2, opacity: 0.8)
                        )
                        .frame(height: 40)
                    )
                    
                     Button("ChatPage.Send") {
                         withAnimation {
                            proxy.scrollTo(locationPoint, anchor: .top)
                        }
                        vDidSendMessage()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundColor(uiColor)
                        .frame(height: 40)
                    )
                } // Message Pop
                .padding(.horizontal)
                .background(
                    VisualEffectView(effect: UIBlurEffect(style: .regular))
                        .ignoresSafeArea()
                )
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
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
            ChatPage(friendImageName: "TestImage", selfImageName: selfImageName, objectsVars: VCEnvironmentObjects(), uiColor: .constant(.blue))
                .environmentObject(VCEnvironmentObjects())
            ChatPage(friendImageName: "EmptyHeadImage", selfImageName: selfImageName, objectsVars: VCEnvironmentObjects(), uiColor: .constant(.blue))
                .environmentObject(VCEnvironmentObjects())
        }
    }
}

enum FocusEnum {
    case messagePop
}
