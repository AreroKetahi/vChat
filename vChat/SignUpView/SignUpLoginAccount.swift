//
//  SignUpLoginAccount.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/7.
//

import SwiftUI

struct SignUpLoginAccount: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordBoxPresent = false
    @State private var passwordState: PasswordBoxState_SignUp = .enterEmail
    
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            Text("Login")
                .padding(.bottom)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Spacer().frame(height: 30)
            VStack {
                Spacer().frame(height: 10)
                HStack {
                    Spacer().frame(width: 10)
                    TextField("e-mail...", text: $email)
                        .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .foregroundColor(
                                colorScheme == .light ?
                                Color(red: 0.9, green: 0.9, blue: 0.9) :
                                Color(red: 0.1, green: 0.1, blue: 0.1)
                            )
                    )
                    .keyboardType(.emailAddress)
                    .onChange(of: email) { _ in
                        if !isEmailString(email) {
                            isPasswordBoxPresent = false
                            passwordState = .notEmail
                        } else if !isAccountExist(localAccount, email: email) {
                            isPasswordBoxPresent = false
                            passwordState = .noSuchAccount
                        } else {
                            isPasswordBoxPresent = true
                            passwordState = .enterPassword
                        }
                    }
                    Spacer().frame(width: 10)
                }
                Spacer().frame(height: 10)
                if isPasswordBoxPresent {
                    HStack {
                        Spacer().frame(width: 10)
                        SecureField("LockedPage.PasswordPlaceholder", text: $password)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .foregroundColor(
                                        colorScheme == .light ?
                                        Color(red: 0.9, green: 0.9, blue: 0.9) :
                                            Color(red: 0.1, green: 0.1, blue: 0.1)
                                    )
                            )
                        Spacer().frame(width: 10)
                    }
                    .onChange(of: password) { _ in
                        if password == "" {
                            passwordState = .enterPassword
                        } else if password.count < 8 {
                            passwordState = .passwordLess8
                        } else {
                            if isAccountExist(localAccount, email: email.lowercased(), password: password) {
                                passwordState = .empty
                            } else {
                                passwordState = .error
                            }
                        }
                    }
                    Spacer().frame(height: 10)
                }
            } // Login Box
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
            } // Password Note
            HStack {
                Spacer().frame(width: 10)
                if passwordState == .empty {
                    NavigationLink {
                        SignUpFinish()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Login")
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                            )
                    }
                }
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("Register an account...")
                }
            } // Register & Login
            .padding()
            Spacer()
        }
        .padding(.vertical)
    }
    
    private var autoPasswordTextField: String {
        switch(passwordState) {
            case .error:
                return NSLocalizedString("LockedPage.PasswordError", comment: "super:LockedPage")
            case .enterPassword:
                return NSLocalizedString("LockedPage.EnterPassword", comment: "super:LockedPage")
            case .passwordLess8:
                return NSLocalizedString("LockedPage.PasswordLess", comment: "super:LockedPage")
            case .notEmail:
                return NSLocalizedString("SignUp.UnknowEmail", comment: "super:SignUp")
            case .noSuchAccount:
                return NSLocalizedString("SignUp.NoSuchAccount", comment: "super:SignUp")
            case .enterEmail:
                return NSLocalizedString("SignUp.EnterEmail", comment: "super:SignUp")
            case .empty:
                return ""
        }
    }
}

struct SignUpLoginAccount_Previews: PreviewProvider {
    static var previews: some View {
        SignUpLoginAccount()
    }
}

enum PasswordBoxState_SignUp {
    case error, enterPassword, passwordLess8, notEmail, noSuchAccount, enterEmail, empty
}
