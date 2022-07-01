//
//  MessagePopSent.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/1.
//

import SwiftUI

struct MessagePopSent: View {
    var messages: VCMessage
    var body: some View {
        HStack {
            Spacer()
            Text(messages.messageContent)
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(
                        cornerRadius: 10,
                        style: .continuous
                    )
                    .foregroundColor(.blue)
                    .frame(height:45)
                )
                .frame(height: 49)
                .shadow(color: Color(.displayP3, red: 0/255, green: 122/255, blue: 255/255, opacity: 0.5),
                        radius: 5, x: 0, y: 0)
            PersonHeadImage(imageName: "EmptyHeadImage")
            Spacer().frame(width:20)
        } // Self Messages
    }
}

struct MessagePopSent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessagePopSent(messages: VCEnvironmentObjects().messages[1])
            MessagePopSent(messages: VCEnvironmentObjects().messages[1])
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 300, height: 60))
    }
}
