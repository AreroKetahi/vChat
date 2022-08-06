//
//  SetUpAppLockPrimary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct SetUpAppLockPrimary: View {
    @Binding var isSetUpAppLockPresent: Bool
    @Binding var password: String
    @Binding var autoPasswordTextField_isError: Bool
    @Binding var passwordCertificate: String
    @Binding var appLockPrimaryDismissLock: Bool
    @Binding var isAppLockEnable: Bool
    @Binding var appLockToogleLock: Bool
    
    @Binding var isBioLoginAuthPass: Bool
    @Binding var isAppLockChangeSheetPresent: Bool
    
    @State private var passwordBoxState: PasswordBoxState = .enterPassword
    
    @Environment(\.colorScheme) private var colorScheme
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
                        SetUpAppLockSecondary(
                            isBioLoginAuthPass: $isBioLoginAuthPass,
                            isSetUpAppLockPresent: $isSetUpAppLockPresent,
                            isAppLockChangeSheetPresent: $isAppLockChangeSheetPresent,
                            appLockPrimaryDismissLock: $appLockPrimaryDismissLock
                        )
                        .navigationBarTitle("SetUpAppLock.Title")
                    } label: {
                        Text("SetUpAppLock.Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15, style: .continuous).foregroundColor(.blue))
                }
                }
                Spacer()
            }
            .navigationTitle("SetUpAppLock.Title")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button {
                    isSetUpAppLockPresent = false
                } label: {
                    VStack {
                        Spacer().frame(height: 10)
                        HStack {
                            Spacer().frame(width: 10)
                            Text("SetUpAppLock.Cancal")
                                .foregroundColor(.white)
                            Spacer().frame(width: 10)
                        }
                        Spacer().frame(height: 10)
                    }
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).foregroundColor(.blue))
                }
            )
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
            isSetUpAppLockPresent: .constant(true),
            password: .constant(""),
            autoPasswordTextField_isError: .constant(true),
            passwordCertificate: .constant(""),
            appLockPrimaryDismissLock: .constant(true),
            isAppLockEnable: .constant(true),
            appLockToogleLock: .constant(true),
            isBioLoginAuthPass: .constant(true),
            isAppLockChangeSheetPresent: .constant(true)
        )
    }
}

enum PasswordBoxState {
    case enterPassword, lessEightChara, match, noMatch, noCertificate
}
