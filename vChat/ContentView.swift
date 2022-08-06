//
//  ContentView.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @Binding var appState: AppState
    @Binding var isAppLocked: Bool
    @Binding var isAppLockEnable: Bool
    @Binding var isAppReloadEnable: Bool
    var body: some View {
        VStack {
            if isAppLocked && isAppLockEnable {
                LockedPage(isAppLocked: $isAppLocked)
            } else {
                EntryPoint(
                    isAppLocked: $isAppLocked,
                    isAppLockEnable: $isAppLockEnable
                )
                    .environmentObject(VCEnvironmentObjects())
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
            if isAppLockEnable {
                isAppLocked = true
            } else {
                isAppReloadEnable = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            appState: .constant(.lock),
            isAppLocked: .constant(true),
            isAppLockEnable: .constant(true),
            isAppReloadEnable: .constant(false)
        )
//            .environment(\.locale, .init(identifier: "ar"))
//            .environment(\.layoutDirection, .rightToLeft)
    }
}
