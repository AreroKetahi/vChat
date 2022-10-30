//
//  AppLock.swift
//  vChat
//
//  Created by 苏子轩 on 2022/10/23.
//

import SwiftUI

struct AppLock: View {
    @ObservedObject private var storage = StoragedVars()
    
    @Binding var isAppLockEnable: Bool
    @State private var isAppLockConxtextPresent = true
    @State private var isAppLockSheetPresent = false
    @State private var isCloseAppLockSecPresent = false
    @State private var isBioAuthPass = false
    
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        Toggle(isOn: $isAppLockConxtextPresent) {
            Text("App Lock")
        }
        .onChange(of: isAppLockConxtextPresent) {_ in
            if isAppLockConxtextPresent != isAppLockEnable {
                isAppLockSheetPresent = true
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $isAppLockSheetPresent) {
            if isAppLockEnable {
               CloseAppLockPrimary(
                isAppLockEnable: $isAppLockEnable,
                isAppLockSheetPresent: $isAppLockSheetPresent,
                isCloseAppLockSecPresent: $isCloseAppLockSecPresent
               )
            } else {
                SetUpAppLockPrimary(isAppLockEnable: $isAppLockEnable, isAppLockSheetPresent: $isAppLockSheetPresent, isBioLoginAuthPass: $isBioAuthPass)
            }
        }
        .onChange(of: isAppLockSheetPresent) {_ in
            if !isAppLockSheetPresent {
                if isAppLockConxtextPresent != isAppLockEnable {
                    isAppLockConxtextPresent.toggle()
                }
            }
        }
    }
}

struct AppLock_Previews: PreviewProvider {
    static var previews: some View {
        AppLock(isAppLockEnable: .constant(false))
    }
}
