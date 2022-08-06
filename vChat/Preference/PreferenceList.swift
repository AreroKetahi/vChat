//
//  PreferenceList.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/2.
//

import SwiftUI
import LocalAuthentication

struct PreferenceList: View {
    var thisSelf: Person
    @Binding var uiColor: Color
    @Binding var isAppLockEnable: Bool
    @Binding var navigationTitle: String

    @State private var isAppLockChangeSheetPresent = false
    @State private var appLockToogleLock = false
    @State private var isAppLockChangePasswordBoxPresent = false
    
    @State private var autoPasswordTextField_isError = false
    @State private var appLockPrimaryDismissLock = false
    
    @State private var password = ""
    @State private var passwordCertificate = ""
    @State private var isSetUpAppLockPresent = false
    @State private var isBioLoginAuthPass = false
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 10)
            HStack(alignment: .top) {
                Spacer()
                    .frame(width: 20)
                Image("EmptyHeadImage")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color(.displayP3, red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5), radius: 5)
                .frame(width: 100, height: 100)
//                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(thisSelf.remark ?? thisSelf.nickname)
                        .font(.title)
                    
                    HStack {
                        Text("ContactPage.UID").bold()
                        Text("\(String(thisSelf.uid))")
                            .font(.system(size: 18, design: .monospaced))
                    }
                }
                .padding()
                Spacer()
            }
            Divider()
            AccentColor(uiColor: $uiColor, thisSelf: thisSelf)// Accent Color
            Divider()
                .padding(.vertical)
            Toggle(isOn: $isAppLockEnable) {
                Text("App Lock")
            }
            .onChange(of: isAppLockEnable) {_ in
                if isAppLockChangeSheetPresent || appLockToogleLock {
                    isAppLockChangeSheetPresent = false
                } else if !appLockToogleLock {
                    appLockToogleLock = true
                    isAppLockChangeSheetPresent = true
                }
            }
            .padding(.horizontal)
            .sheet(isPresented: $isAppLockChangeSheetPresent, onDismiss: didAppLockChangeSheetDissmiss) {
                if isAppLockEnable {
                   SetUpAppLock(
                    isSetUpAppLockPresent: $isSetUpAppLockPresent,
                    appLockPrimaryDismissLock: $appLockPrimaryDismissLock,
                    isAppLockEnable: $isAppLockEnable,
                    appLockToogleLock: $appLockToogleLock,
                    password: $password,
                    autoPasswordTextField_isError: $autoPasswordTextField_isError,
                    passwordCertificate: $passwordCertificate,
                    isBioLoginAuthPass: $isBioLoginAuthPass,
                    isAppLockChangeSheetPresent: $isAppLockChangeSheetPresent
                   )
                } else {
                     CloseAppLock(
                        isAppLockChangePasswordBoxPresent: $isAppLockChangePasswordBoxPresent,
                        isAppLockEnable: $isAppLockEnable,
                        appLockToogleLock: $appLockToogleLock,
                        isAppLockChangeSheetPresent: $isAppLockChangeSheetPresent,
                        appLockPrimaryDismissLock: $appLockPrimaryDismissLock
                     )
                }
            }
            Spacer()
        }
        .padding()
        .onAppear {
            navigationTitle = NSLocalizedString("PreferenceList.Preference", comment:"super:PreferenceList")
        }
    }
    
    private func didAppLockChangeSheetDissmiss() {
        if !appLockPrimaryDismissLock {
            isAppLockEnable.toggle()
            DispatchQueue.main.async {
                appLockPrimaryDismissLock = false
            }
        } else if appLockPrimaryDismissLock {
            appLockPrimaryDismissLock = false
        }
        DispatchQueue.main.async {
            appLockToogleLock = false
        }
    }
    
    private var autoPasswordTextField: String {
        
        if password == "" {
            DispatchQueue.main.async {
                autoPasswordTextField_isError = false
            }
            return NSLocalizedString("LockedPage.EnterPassword", comment: "super:LockedPage")
        } else if password.count < 8 {
            DispatchQueue.main.async {
                autoPasswordTextField_isError = false
            }
            return NSLocalizedString("LockedPage.PasswordLess", comment: "super:LockedPage")
        } else {
            if !autoPasswordTextField_isError {
                return ""
            } else {
                return NSLocalizedString("LockedPage.PasswordError", comment: "super:LockedPage")
            }
        }
    }
    
    private var autoTouchID_FaceID: String {
        if safeAreaInsets.bottom > 0 {
            return NSLocalizedString("LockedPage.FaceID", comment: "super:LockedPage")
        } else {
            return NSLocalizedString("LockedPgae.TouchID", comment: "super:LockedPage")
        }
    }
    
    private var autoTouchID_FaceIDIcon: String {
        if safeAreaInsets.bottom > 0 {
            return "faceid"
        } else {
            return "touchid"
        }
    }
}

struct PreferenceList_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceList(
            thisSelf: friendList[0],
            uiColor: .constant(.blue),
            isAppLockEnable: .constant(true),
            navigationTitle: .constant("Preference")
        )
    }
}
