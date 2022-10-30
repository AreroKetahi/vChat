//
//  SetUpAppLockTertiary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct SetUpAppLockTertiary: View {
    @ObservedObject private var storage = StoragedVars()
    
    @Binding var isAppLockEnable: Bool
    @Binding var isAppLockSheetPresent: Bool
    @Binding var password: String
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer().frame(width: 10)
                VStack {
                    Text("SetUpAppLock.Tertiary.Finish")
                        .font(.system(size: 50, weight: .semibold, design: .rounded))
                    Text("SetUpAppLock.Tertiary.Subtitle")
                        .font(.system(size: 20, design: .rounded))
                    Spacer().frame(height: 20)
                }
                .padding()
            } // Title
            Button {
                isAppLockEnable = true
                isAppLockSheetPresent = false
            } label: {
                Text("SetUpAppLock.Tertiary.Close")
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous).foregroundColor(.blue))
            }
            Spacer()
            Spacer().frame(height: 100)
        }
        .onAppear {
            storage.localPassword = password.sha256
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}

struct SetUpAppLockTertiary_Previews: PreviewProvider {
    static var previews: some View {
        SetUpAppLockTertiary(
            isAppLockEnable: .constant(false),
            isAppLockSheetPresent: .constant(true),
            password: .constant("")
        )
    }
}
