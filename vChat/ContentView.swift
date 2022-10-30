//
//  ContentView.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    var appState: AppState
    @Binding var isAppLocked: Bool
    @Binding var isAppLockEnable: Bool
    @Binding var isAppReloadEnable: Bool
    var body: some View {
        VStack {
            switch appState {
                case .content:
                    EntryPoint(
                        isAppLocked: $isAppLocked,
                        isAppLockEnable: $isAppLockEnable
                    )
                        .environmentObject(VCEnvironmentObjects())
                case .lock:
                    LockedPage(isAppLocked: $isAppLocked)
                case .signUp:
                    VStack {
                        
                    }
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
            appState: .lock,
            isAppLocked: .constant(true),
            isAppLockEnable: .constant(true),
            isAppReloadEnable: .constant(false)
        )
//            .environment(\.locale, .init(identifier: "ar"))
//            .environment(\.layoutDirection, .rightToLeft)
    }
}
