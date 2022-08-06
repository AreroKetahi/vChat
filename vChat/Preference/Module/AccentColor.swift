//
//  AccentColor.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct AccentColor: View {
    @Binding var uiColor: Color
    var thisSelf: Person
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack {
            ColorPicker("PreferenceList.GlobalColorPicker", selection: $uiColor)
                .padding(.horizontal)
            Divider()
            VStack {
                HStack {
                    Text("PreferenceList.GlobalColorPicker.Preview")
                        .font(.system(size: 15, weight: .light, design: .default))
                    Spacer()
                }
                .padding([.leading, .bottom, .trailing])
                HStack {
                    PersonLabelComponent(imageName: selfImageName, nickname: thisSelf.remark ?? thisSelf.nickname)
                        .overlay(Circle()
                            .frame(width: 12, height: 12)
                            .position(x: 47, y: 3)
                            .foregroundColor(uiColor)
                            .shadow(color: uiColor, radius: 2)
                        )
                        .padding()
                    Spacer()
                    Image(systemName: isRightToLeftEnable() ? "chevron.left" : "chevron.right")
                        .foregroundColor(.gray)
                    Spacer()
                        .frame(width: 20)
                } // Message Notification
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(
                            colorScheme == .light ?
                            Color(red: 0.95, green: 0.95, blue: 0.95) :
                                Color(red: 0.15, green: 0.15, blue: 0.15)
                        )
                )
                Spacer().frame(height: 10)
                VStack {
                    Spacer()
                        .frame(height: 2)
                    AccentColorPreviewPopReceive()
                        .padding(.top)
                    AccentColorPreviewPopSent(imageName: selfImageName, uiColor: $uiColor)
                        .padding(.bottom)
                    Spacer()
                        .frame(height: 2)
                } // Message Pop
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(
                            colorScheme == .light ?
                            Color(red: 0.95, green: 0.95, blue: 0.95) :
                                Color(red: 0.15, green: 0.15, blue: 0.15)
                        )
                )
            } // Accent Color Preview
        }
    }
}

struct AccentColor_Previews: PreviewProvider {
    static var previews: some View {
        AccentColor(uiColor: .constant(.blue), thisSelf: friendList[0])
    }
}
