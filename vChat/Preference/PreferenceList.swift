//
//  PreferenceList.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/2.
//

import SwiftUI

struct PreferenceList: View {
    var thisSelf: Person
    @Environment(\.colorScheme) private var colorScheme
    @Binding var uiColor: Color
    @Binding var navigationTitle: String
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 10)
            HStack(alignment: .top) {
                Spacer()
                    .frame(width: 20)
                Image("EmptyHeadImage")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color(.displayP3, red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5), radius: 5)
                .frame(width: 100, height: 100)
//                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(thisSelf.remark ?? thisSelf.nickname)
                        .font(.title)
                    
                    HStack {
                        Text("ContactPage.UID").bold()
                        Text("\(String(thisSelf.uid))")
                            .font(.system(size: 18, design: .monospaced))
                    }
                }
                .padding()
                Spacer()
            }
            Divider()
            ColorPicker("PreferenceList.GlobalColorPicker", selection: $uiColor)
                .padding()
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
            Divider()
                .padding(.vertical)
            Spacer()
        }
        .padding()
        .onAppear {
            navigationTitle = NSLocalizedString("PreferenceList.Preference", comment:"super:PreferenceList")
        }
    }
}

struct PreferenceList_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceList(thisSelf: friendList[0], uiColor: .constant(.blue), navigationTitle: .constant("Preference"))
    }
}
