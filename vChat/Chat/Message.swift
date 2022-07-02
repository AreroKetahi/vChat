//
//  Message.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/30.
//

import Foundation
import SwiftUI
import Combine

//struct VCMessage: Identifiable {
//    var id: String{messageContent}
//
//    var messageContent: String
//    var isReceive: Bool
//}

struct VCMessage: Identifiable {
    var id: String{messageContent}
    
    let messageContent: String
    let isReceive: Bool
}


final class VCEnvironmentObjects: ObservableObject {
    @Published var messages = [
        VCMessage(messageContent: "Hello World!", isReceive: true),
        VCMessage(messageContent: "Yeah it is, how are you?", isReceive: false),
        VCMessage(messageContent: "Pretty, an't you?", isReceive: true),
        VCMessage(messageContent: "Let's do it again!", isReceive: false),
        VCMessage(messageContent: "Hello World!", isReceive: true),
        VCMessage(messageContent: "Yeah it is, how are you?", isReceive: false),
        VCMessage(messageContent: "Pretty, an't you?", isReceive: true),
        VCMessage(messageContent: "Let's do it again!", isReceive: false),
        VCMessage(messageContent: "Hello World!", isReceive: true),
        VCMessage(messageContent: "Yeah it is, how are you?", isReceive: false),
        VCMessage(messageContent: "Pretty, an't you?", isReceive: true),
        VCMessage(messageContent: "Let's do it again!", isReceive: false),
        VCMessage(messageContent: "Hello World!", isReceive: true),
        VCMessage(messageContent: "Yeah it is, how are you?", isReceive: false),
        VCMessage(messageContent: "Pretty, an't you?", isReceive: true),
        VCMessage(messageContent: "Let's do it again!", isReceive: false),
        VCMessage(messageContent: "Hello World!", isReceive: true),
        VCMessage(messageContent: "Yeah it is, how are you?", isReceive: false),
        VCMessage(messageContent: "Pretty, an't you?", isReceive: true),
        VCMessage(messageContent: "Let's do it again!", isReceive: false)
    ]
}
