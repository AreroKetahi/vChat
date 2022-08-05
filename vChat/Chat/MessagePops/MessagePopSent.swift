//
//  MessagePopSent.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/1.
//

import SwiftUI

struct MessagePopSent: View {
    var messages: String
    var imageName: String?
    @Binding var uiColor: Color
    var body: some View {
        if !isRightToLeftEnable() {
            HStack {
                Spacer()
                Text(messages)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .foregroundColor(uiColor)
                        .frame(height:45)
                    )
                    .frame(height: 49)
                    .shadow(color: uiColor.opacity(0.5),
                            radius: 5, x: 0, y: 0)
                PersonHeadImage(imageName: imageName != nil ? imageName! : "EmptyHeadImage")
                Spacer().frame(width:20)
            } // Self Messages LTR
        } else {
            HStack {
                Spacer().frame(width:20)
                PersonHeadImage(imageName: imageName != nil ? imageName! : "EmptyHeadImage")
                Text(messages)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .foregroundColor(uiColor)
                        .frame(height:45)
                    )
                    .frame(height: 49)
                    .shadow(color: uiColor.opacity(0.5),
                            radius: 5, x: 0, y: 0)
                Spacer()
            } // Self Messages RTL
        }
    }
}

struct MessagePopSent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessagePopSent(messages: VCEnvironmentObjects().messages[1].messageContent, imageName: selfImageName, uiColor: .constant(.blue))
            MessagePopSent(messages: VCEnvironmentObjects().messages[1].messageContent, imageName: selfImageName, uiColor: .constant(.blue))
                .environment(\.layoutDirection, .rightToLeft)
        }
        .previewLayout(.fixed(width: 300, height: 60))
    }
}
