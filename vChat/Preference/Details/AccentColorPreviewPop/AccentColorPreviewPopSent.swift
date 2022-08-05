//
//  AccentColorPreviewPopSent.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/5.
//

import SwiftUI

struct AccentColorPreviewPopSent: View {
    var imageName: String?
    @Binding var uiColor: Color
    var body: some View {
        if !isRightToLeftEnable() {
            HStack {
                Spacer()
                Text("PreferenceList.GlobalColorPicker.Preview.Sent")
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
                Text("PreferenceList.GlobalColorPicker.Preview.Sent")
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

struct AccentColorPreviewPopSent_Previews: PreviewProvider {
    static var previews: some View {
        AccentColorPreviewPopSent(imageName: "TestImage", uiColor: .constant(.blue))
    }
}
