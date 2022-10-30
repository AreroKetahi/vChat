//
//  SetUpAppLockPrimary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI
import LocalAuthentication

struct SetUpAppLockPrimary: View {
    @Binding var isAppLockEnable: Bool
    @Binding var isAppLockSheetPresent: Bool
    
    @State private var password = ""
    @State private var passwordCertificate = ""
    @State private var passwordBoxState: PasswordBoxState_SetUpApp = .enterPassword
    @State private var autoPasswordTextField_isError = false
    
    @State private var isBioNoticePresent = false
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Binding var isBioLoginAuthPass: Bool
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer().frame(width: 10)
                    VStack(alignment: .leading) {
                        Text("SetUpAppLock.Primary.Title")
                            .font(.system(size: 50, weight: .semibold, design: .rounded))
                        if isBiometricsEnable() {
                            Text("SetUpAppLock.Title.3")
                                .font(.system(size: 20, design: .rounded))
                        } else {
                            Text("SetUpAppLock.Title.2")
                                .font(.system(size: 20, design: .rounded))
                        }
                        Spacer().frame(height: 20)
                        Text("SetUpAppLock.Primary.SetPassword")
                            .font(.system(size: 30, design: .rounded))
                    }
                    .padding()
                    Spacer()
                    
                } // Title
                VStack {
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
                                .onChange(of: password) { _ in
                                    if password == "" {
                                        passwordBoxState = .enterPassword
                                    } else if password.count < 8 {
                                        passwordBoxState = .lessEightChara
                                    } else {
                                        passwordBoxState = .noCertificate
                                    }
                                }
                            Spacer().frame(width: 10)
                        }
                        Spacer().frame(height: 10)
                    }
                    VStack {
                        HStack {
                            Spacer().frame(width: 10)
                            SecureField("SetUpAppLock.Primary.CertificatePlaceHolder", text: $passwordCertificate)
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
                                .onChange(of: passwordCertificate) { _ in
                                    if passwordCertificate == "" {
                                        passwordBoxState = .noCertificate
                                    } else if password == passwordCertificate {
                                        passwordBoxState = .match
                                    } else {
                                        passwordBoxState = .noMatch
                                    }
                                } // Password matching
                            Spacer().frame(width: 10)
                        }
                        Spacer().frame(height: 10)
                    }
                } // PasswordBox
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
                Spacer().frame(height: 20)
                if passwordBoxState == .match {
                    NavigationLink {
                        if isBiometricsEnable() {
                            SetUpAppLockSecondary(
                                isAppLockEnable: $isAppLockEnable,
                                isAppLockSheetPresent: $isAppLockSheetPresent,
                                isBioLoginAuthPass: $isBioLoginAuthPass,
                                password: $password
                            )
                                .navigationBarTitle("SetUpAppLock.Title")
                        } else {
                            SetUpAppLockTertiary(isAppLockEnable: $isAppLockEnable, isAppLockSheetPresent: $isAppLockSheetPresent, password: $password)
                                .navigationBarBackButtonHidden(true)
                        }
                    } label: {
                        Text("SetUpAppLock.Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15, style: .continuous).foregroundColor(.blue))
                    }
                }
                if !isBiometricsEnable() {
                    VStack {
                        Button {
                            isBioNoticePresent = true
                        } label: {
                            HStack {
                                Image(systemName: "info.circle")
                                Text("Will skip setting \(autoTouchID_FaceID).")
                            }
                        }
                    }
                    .alert("LockedPage.CanNotUse.Title", isPresented: $isBioNoticePresent, actions: {
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
                }
                Spacer()
            }
            .navigationTitle("SetUpAppLock.Title")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button {
                    isAppLockSheetPresent = false
                } label: {
                    Circle()
                        .foregroundColor(Color("LightGray"))
                        .frame(height: 40)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
//                        .padding()
                }
            )
        }
    }
    
    private var autoTouchID_FaceID: String {
        if safeAreaInsets.bottom > 0 {
            return NSLocalizedString("LockedPage.FaceID", comment: "super:LockedPage")
        } else {
            return NSLocalizedString("LockedPgae.TouchID", comment: "super:LockedPage")
        }
    }
    
    private var autoPasswordTextField: String {
        switch passwordBoxState {
            case .match:
                return NSLocalizedString("SetUpAppLock.Primary.Match", comment: "super:SetUpAppLock")
            case .enterPassword:
                return NSLocalizedString("LockedPage.EnterPassword", comment: "super:LockedPage")
            case .lessEightChara:
                return NSLocalizedString("LockedPage.PasswordLess", comment: "super:LockedPage")
            case .noMatch:
                return NSLocalizedString("SetUpAppLock.Primary.NoMatch", comment: "super:SetUpAppLock")
            case .noCertificate:
                return NSLocalizedString("SetUpAppLock.Primary.NoCertificate", comment: "super:SetUpAppLock")
        }
    }
}

struct SetUpAppLockPrimary_Previews: PreviewProvider {
    static var previews: some View {
        SetUpAppLockPrimary(
            isAppLockEnable: .constant(false),
            isAppLockSheetPresent: .constant(true),
            isBioLoginAuthPass: .constant(false))
    }
}

enum PasswordBoxState_SetUpApp {
    case enterPassword, lessEightChara, match, noMatch, noCertificate
}
