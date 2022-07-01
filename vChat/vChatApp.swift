//
//  vChatApp.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/15.
//

import SwiftUI

@main
struct vChatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(EnviromentObjects())
        }
    }
}
