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
    @State var isSetupTo = false
    var appState: AppState {
        if isAppLocked && isAppLockEnable {
            return .lock
        } else {
            return .content
        }
    }
    @State var isAppReloadEnable = false
    var body: some Scene {
        WindowGroup {
            if !isAppReloadEnable {
                ContentView(
                    appState: appState,
                    isAppLocked: $isAppLocked,
                    isAppLockEnable: $isAppLockEnable,
                    isAppReloadEnable: $isAppReloadEnable
                )
                .onAppear(perform: appLaunchPreSet)
            } else {
                EmptyPage(isAppReloadEnable: $isAppReloadEnable)
            }
        }
    }
    
    private func appLaunchPreSet() {
//        // Check if AppCore.json exist
//        if !FileManager.default.fileExists(atPath: homePath + "/Documents/AppCore.json") {
//            let createAppCoreFile = FileManager.default.createFile(atPath: homePath + "/Documents/AppCore.json", contents: nil, attributes: nil)
//            print("AppCore.json[F] not exists, create AppCore.json[F]: \(createAppCoreFile)")
//            try! originalAppCore.write(homePath + "/Documents/AppCore.json", atomically: true, encoding: .utf8)
//            isSetupTo = true
//        }
//        // Check if Boot.json exist
//        if !FileManager.default.fileExists(atPath: homePath + "/Documents/Boot.json") {
//            let createBootFile = FileManager.default.createFile(atPath: homePath + "/Documents/Boot.json", contents: nil, attributes: nil)
//            print("Boot.json[F] not exists, create Boot.json[F]: \(createBootFile)")
//        }
//        // Decrypt Boot.json
//        // Launch at Boot.json
//        // Check if PersonStack exist
//        if !FileManager.default.fileExists(atPath: homePath + "/Documents/PersonStack") {
//            try? FileManager.default.createDirectory(atPath: homePath + "/Documents/PersonStack", withIntermediateDirectories: true, attributes: nil)
//
//            let createBootFile = FileManager.default.createFile(atPath: homePath + "/Documents/PersonStack/Source.cgf", contents: nil, attributes: nil)
//            print("Boot.json[F] not exists, create Boot.json[F]: \(createBootFile)")
//        }
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
    case content, lock, signUp
}
