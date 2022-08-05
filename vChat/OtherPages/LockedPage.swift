//
//  LockedPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/5.
//

import SwiftUI
import LocalAuthentication

struct LockedPage: View {
    var DEBUG_BIOLOGIN = false
    
    @State private var autoPasswordTextField_isError = false
    @State private var password = ""
    @State private var isPopPresent = false
    @Binding var isAppLocked: Bool
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        VStack {
            Text("LockedPage.AppLocked")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Spacer().frame(height: 10)
            VStack {
                Spacer().frame(height: 10)
                HStack {
                    Spacer().frame(width: 10)
                    SecureField("LockedPage.PasswordPlaceholder", text: $password)
                        .padding()
                        .onTapGesture {
                            autoPasswordTextField_isError = false
                        }
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .foregroundColor(
                                colorScheme == .light ?
                                Color(red: 0.9, green: 0.9, blue: 0.9) :
                                Color(red: 0.1, green: 0.1, blue: 0.1)
                            )
                    )
                    Button {
                        if password.count >= 8 {
                            if  password.sha256 == StoragedVars().localPassword {
                                withAnimation(.easeInOut) {
                                    isAppLocked = false
                                }
                            } else {
                                autoPasswordTextField_isError = true
                            }
                        }
                    } label: {
                        Image(systemName: "lock.open.fill")
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .foregroundColor(.blue)
                            )
                    }
                    Spacer().frame(width: 10)
                }
                Spacer().frame(height: 10)
            }
            .background(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .foregroundColor(
                        colorScheme == .light ?
                        Color(red: 0.95, green: 0.95, blue: 0.95) :
                        Color(red: 0.15, green: 0.15, blue: 0.15)
                    )
            )
            .padding(.horizontal)
            HStack {
                Spacer().frame(width: 42)
                Text(autoPasswordTextField)
                    .font(.callout)
                Spacer()
            } // Password note text
            if isBiometricsEnable() || DEBUG_BIOLOGIN {
                Spacer().frame(height: 10)
                Button(action: localAuthenticationUnlock){
                    HStack {
                        Image(systemName: autoTouchID_FaceIDIcon)
                        Text("LockedPage.UnlockText \(autoTouchID_FaceID)")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        
                }
            } else {
                Spacer().frame(height: 30)
                VStack {
                    Button {
                        isPopPresent = true
                    } label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("LockedPage.CanNotUseBio\(autoTouchID_FaceID)")
                        }
                    }
                }
                .alert("LockedPage.CanNotUse.Title", isPresented: $isPopPresent, actions: {
                    if safeAreaInsets.bottom > 0 {
                        Text("LockedPage.CanNotUse.FaceID")
                    } else {
                        Text("LockedPage.CanNotUse.TouchID")
                    }
                }, message: {
                    if safeAreaInsets.bottom > 0 {
                        Text("LockedPage.CanNotUse.FaceID")
                    } else {
                        Text("LockedPage.CanNotUse.TouchID")
                    }
                })
            }// Use FaceID/TouchID
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
    
    private var autoPasswordTextField: String {
        if !autoPasswordTextField_isError {
            if password == "" {
                autoPasswordTextField_isError = false
                return NSLocalizedString("LockedPage.EnterPassword", comment: "super:LockedPage")
            } else if password.count < 8 {
                autoPasswordTextField_isError = false
                return NSLocalizedString("LockedPage.PasswordLess", comment: "super:LockedPage")
            } else {
                return ""
            }
        } else {
            return NSLocalizedString("LockedPage.PasswordError", comment: "super:LockedPage")
        }
    }
    
    func localAuthenticationUnlock() {
        if !DEBUG_BIOLOGIN {
            let context = LAContext()
            let reason = "You need use \(autoTouchID_FaceID) to unlcok vChat"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // 鉴权完成
                DispatchQueue.main.async {
                    if success {
                        withAnimation(.easeInOut) {
                            isAppLocked = false
                        }
                    } else {
                       isAppLocked = true
                    }
                }
            }
        } else {
            withAnimation(.easeInOut) {
                isAppLocked = false
            }
        }
    }
}

struct LockedPage_Previews: PreviewProvider {
    static var previews: some View {
        LockedPage(DEBUG_BIOLOGIN: false, isAppLocked: .constant(true))
    }
}
