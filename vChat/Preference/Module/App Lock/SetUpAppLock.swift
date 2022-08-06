//
//  SetUpAppLock.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct SetUpAppLock: View {
    @Binding var isSetUpAppLockPresent: Bool
    @Binding var appLockPrimaryDismissLock: Bool
    @Binding var isAppLockEnable: Bool
    @Binding var appLockToogleLock: Bool
    
    @Binding var password: String
    @Binding var autoPasswordTextField_isError: Bool
    @Binding var passwordCertificate: String
    @Binding var isBioLoginAuthPass: Bool
    @Binding var isAppLockChangeSheetPresent: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    didAppLockChangeSheetDissmiss()
                } label: {
                    VStack {
                        Spacer().frame(height: 10)
                        HStack {
                            Spacer().frame(width: 10)
                            Text("Cancal")
                                .foregroundColor(.white)
                            Spacer().frame(width: 10)
                        }
                        Spacer().frame(height: 10)
                    }
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).foregroundColor(.blue))
                    .padding([.top, .leading, .trailing])
                }
            }
            Text("Get started with App Lock")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding([.leading, .bottom, .trailing])
            Text("App Lock will protect your app from being used by others when you are not using vChat.")
                .font(.title3)
                .padding([.leading, .bottom, .trailing])
            Text("When you are not using vChat, the app will automatically lock to keep your data safe.")
                .font(.headline)
                .padding(.horizontal)
            Button {
                isSetUpAppLockPresent = true
            } label: {
                HStack {
                    Image(systemName: "lock.shield")
                    Text("Set up App Lock")
                }
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
            .padding()
            Spacer()
        }
        .sheet(isPresented: $isSetUpAppLockPresent) {
           SetUpAppLockPrimary(
            isSetUpAppLockPresent: $isSetUpAppLockPresent,
            password: $password,
            autoPasswordTextField_isError: $autoPasswordTextField_isError,
            passwordCertificate: $passwordCertificate,
            appLockPrimaryDismissLock: $appLockPrimaryDismissLock,
            isAppLockEnable: $isAppLockEnable,
            appLockToogleLock: $appLockToogleLock,
            isBioLoginAuthPass: $isBioLoginAuthPass,
            isAppLockChangeSheetPresent: $isAppLockChangeSheetPresent
           )
        }
    }
    
    private func didAppLockChangeSheetDissmiss() {
        if !appLockPrimaryDismissLock {
            isAppLockEnable.toggle()
            DispatchQueue.main.async {
                appLockPrimaryDismissLock = false
            }
        }
        DispatchQueue.main.async {
            appLockToogleLock = false
        }
    }
}

struct SetUpAppLock_Previews: PreviewProvider {
    static var previews: some View {
        SetUpAppLock(
            isSetUpAppLockPresent: .constant(true),
            appLockPrimaryDismissLock: .constant(true),
            isAppLockEnable: .constant(true),
            appLockToogleLock: .constant(true),
            password: .constant(""),
            autoPasswordTextField_isError: .constant(true),
            passwordCertificate: .constant(""),
            isBioLoginAuthPass: .constant(true),
            isAppLockChangeSheetPresent: .constant(true)
        )
    }
}
