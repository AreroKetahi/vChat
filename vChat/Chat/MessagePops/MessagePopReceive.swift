//
//  MessagePopReceive.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/1.
//

import SwiftUI

struct MessagePopReceive: View {
    @Environment(\.colorScheme) var colorScheme
    var messages: VCMessage
    var body: some View {
        HStack {
            Spacer().frame(width: 20)
            PersonHeadImage(imageName: "TestImage")
            Text(messages.messageContent)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .foregroundColor(Color(
                        cgColor: (
                            colorScheme == .light ?
                            CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1) :
                                CGColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1))
                    ))
                    .frame(height:45)
                )
                .shadow(color: Color(
                    colorScheme == .light ?
                    CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5) :
                        CGColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
                ),
                        radius: 5, x: 0, y: 0)
            Spacer()
        } // Friends Messages
    }
}

struct MessagePopReceive_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessagePopReceive(messages: VCEnvironmentObjects().messages[0])
            MessagePopReceive(messages: VCEnvironmentObjects().messages[0])
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 300, height: 60))
    }
}
