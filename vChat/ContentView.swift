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
    var body: some View {
        VStack {
            if isAppLocked {
                LockedPage(isAppLocked: $isAppLocked)
            } else {
                EntryPoint(isAppLocked: $isAppLocked)
                    .environmentObject(VCEnvironmentObjects())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appState: .constant(.lock), isAppLocked: .constant(true))
//            .environment(\.locale, .init(identifier: "ar"))
//            .environment(\.layoutDirection, .rightToLeft)
    }
}
