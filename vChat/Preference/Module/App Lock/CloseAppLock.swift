//
//  CloseAppLock.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct CloseAppLock: View {
    @Binding var isAppLockChangePasswordBoxPresent: Bool
    @Binding var isAppLockEnable: Bool
    @Binding var appLockToogleLock: Bool
    @Binding var isAppLockChangeSheetPresent: Bool
    @Binding var appLockPrimaryDismissLock:Bool
    var body: some View {
        CloseAppLockPrimary(
           isAppLockChangePasswordBoxPresent: $isAppLockChangePasswordBoxPresent,
           isAppLockEnable: $isAppLockEnable,
           appLockToogleLock: $appLockToogleLock
        )// Close Lock
       .sheet(isPresented: $isAppLockChangePasswordBoxPresent) {
           CloseAppLockSecondary(
               isAppLockChangePasswordBoxPresent: $isAppLockChangePasswordBoxPresent,
               isAppLockChangeSheetPresent: $isAppLockChangeSheetPresent,
               appLockPrimaryDismissLock: $appLockPrimaryDismissLock
           )
       }
    }
}

struct CloseAppLock_Previews: PreviewProvider {
    static var previews: some View {
        CloseAppLock(
            isAppLockChangePasswordBoxPresent: .constant(true),
            isAppLockEnable: .constant(true),
            appLockToogleLock: .constant(true),
            isAppLockChangeSheetPresent: .constant(true),
            appLockPrimaryDismissLock: .constant(true)
        )
    }
}
