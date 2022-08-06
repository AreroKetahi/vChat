//
//  vChatApp.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//

import SwiftUI

@main
struct vChatApp: App {
    @State var isAppLocked = StoragedVars().isAppLocked
    @State var isAppLockEnable = StoragedVars().isAppLockEnable
    @State var appState = AppState.lock
    @State var isAppReloadEnable = false
    var body: some Scene {
        WindowGroup {
            if !isAppReloadEnable {
                ContentView(
                    appState: $appState,
                    isAppLocked: $isAppLocked,
                    isAppLockEnable: $isAppLockEnable,
                    isAppReloadEnable: $isAppReloadEnable
                )
            } else {
                EmptyPage(isAppReloadEnable: $isAppReloadEnable)
            }
        }
    }
}

struct EmptyPage: View {
    @Binding var isAppReloadEnable: Bool
    var body: some View {
        Spacer()
            .onAppear {
                isAppReloadEnable = false
            }
    }
}

enum AppState {
    case content, lock
}
