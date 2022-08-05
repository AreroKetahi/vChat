//
//  MessagePop.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/5.
//

import SwiftUI

struct MessagePop: View {
    var messages: VCMessage
    var imageName: String?
    @Binding var uiColor: Color
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        if messages.isReceive {
            MessagePopReceive(messages: messages.messageContent, imageName: imageName)
        } else {
            MessagePopSent(messages: messages.messageContent, imageName: imageName, uiColor: $uiColor)
        }
    }
}

struct MessagePop_Previews: PreviewProvider {
    static var previews: some View {
        MessagePop(messages: VCEnvironmentObjects().messages[0], uiColor: .constant(.blue))
        MessagePop(messages: VCEnvironmentObjects().messages[1], imageName: "TestImage", uiColor: .constant(.blue))
    }
}
