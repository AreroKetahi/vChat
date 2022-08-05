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
    @State var appState = AppState.lock
    var body: some Scene {
        WindowGroup {
            ContentView(appState: $appState, isAppLocked: $isAppLocked)
        }
    }
}

enum AppState {
    case content, lock
}
