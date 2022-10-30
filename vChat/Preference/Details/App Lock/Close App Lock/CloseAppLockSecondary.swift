//
//  CloseAppLockSecondary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct CloseAppLockSecondary: View {
    @State private var password = ""
    @State private var autoPasswordTextField_isError = false
    
    @Binding var isAppLockEnable: Bool
    @Binding var isAppLockSheetPresent: Bool
    @Binding var isCloseAppLockSecPresent: Bool
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isCloseAppLockSecPresent = false
                } label: {
                    Circle()
                        .foregroundColor(Color("LightGray"))
                        .frame(width: 40)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                        .padding()
                }
            } // Cancal button
            Text("CloseAppLock.Secondary.Title")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .padding()
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
            .padding([.top, .leading, .trailing])
            HStack {
                Spacer().frame(width: 42)
                Text(autoPasswordTextField)
                    .font(.callout)
                Spacer()
            } // Password note text
            .padding(.bottom)
            Button {
                if password.count >= 8 {
                    if  password.sha256 == StoragedVars().localPassword {
                        password = ""
                        isAppLockEnable = false
                        isCloseAppLockSecPresent = false
                        isAppLockSheetPresent = false
                    } else {
                        autoPasswordTextField_isError = true
                    }
                }
            } label: {
                HStack{
                    Image(systemName: "lock.slash.fill")
                    Text("CloseAppLock.Secondary.CloseButton")
                }
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(.blue)
                )
            } //Close App Lock button
            Spacer()
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
}

struct CloseAppLockSecondary_Previews: PreviewProvider {
    static var previews: some View {
        CloseAppLockSecondary(
            isAppLockEnable: .constant(true),
            isAppLockSheetPresent: .constant(true),
            isCloseAppLockSecPresent: .constant(true)
        )
    }
}
