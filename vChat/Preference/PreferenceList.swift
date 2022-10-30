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
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        ScrollView {
            Spacer().frame(height: 10)
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
            AppLock(isAppLockEnable: $isAppLockEnable)
            Spacer()
        }
        .padding()
        .onAppear {
            navigationTitle = NSLocalizedString("PreferenceList.Preference", comment:"super:PreferenceList")
        }
    }
    
//    private var autoPasswordTextField: String {
//
//        if password == "" {
//            DispatchQueue.main.async {
//                autoPasswordTextField_isError = false
//            }
//            return NSLocalizedString("LockedPage.EnterPassword", comment: "super:LockedPage")
//        } else if password.count < 8 {
//            DispatchQueue.main.async {
//                autoPasswordTextField_isError = false
//            }
//            return NSLocalizedString("LockedPage.PasswordLess", comment: "super:LockedPage")
//        } else {
//            if !autoPasswordTextField_isError {
//                return ""
//            } else {
//                return NSLocalizedString("LockedPage.PasswordError", comment: "super:LockedPage")
//            }
//        }
//    }
    
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
