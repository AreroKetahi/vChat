//
//  MessagePopReceive.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/1.
//

import SwiftUI

struct MessagePopReceive: View {
    @Environment(\.colorScheme) private var colorScheme
    var messages: String
    var imageName: String?
    var body: some View {
        if !isRightToLeftEnable() {
            HStack {
                Spacer().frame(width: 20)
                PersonHeadImage(imageName: imageName != nil ? imageName! : "EmptyHeadImage")
                Text(messages)
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
                        CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
                    ),
                            radius: 5, x: 0, y: 0)
                Spacer()
            } // Friends Messages LTR
        } else {
            HStack {
                Spacer()
                Text(messages)
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
                        CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
                    ),
                            radius: 5, x: 0, y: 0)
                PersonHeadImage(imageName: imageName != nil ? imageName! : "EmptyHeadImage")
                Spacer().frame(width: 20)
            } // Friends Messages RTL
        }
        
    }
}

struct MessagePopReceive_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessagePopReceive(messages: VCEnvironmentObjects().messages[0].messageContent)
            MessagePopReceive(messages: VCEnvironmentObjects().messages[0].messageContent)
                .environment(\.layoutDirection, .rightToLeft)
        }
        .previewLayout(.fixed(width: 300, height: 60))
    }
}
