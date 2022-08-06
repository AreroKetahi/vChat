//
//  SetUpAppLockTertiary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct SetUpAppLockTertiary: View {
    @ObservedObject private var storage = StoragedVars()
    
    @Binding var isSetUpAppLockPresent: Bool
    @Binding var isAppLockChangeSheetPresent: Bool
    @Binding var appLockPrimaryDismissLock: Bool
    
    @Binding var password: String
    @State private var isFinishStored = false
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
                isSetUpAppLockPresent = false
                isAppLockChangeSheetPresent = false
                appLockPrimaryDismissLock = true
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
            isSetUpAppLockPresent: .constant(true),
            isAppLockChangeSheetPresent: .constant(true),
            appLockPrimaryDismissLock: .constant(false),
            password: .constant("")
        )
    }
}
