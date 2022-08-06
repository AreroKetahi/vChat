//
//  SetUpAppLockSecondary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI
import LocalAuthentication

struct SetUpAppLockSecondary: View {
    @Binding var isBioLoginAuthPass: Bool
    
    @Binding var isSetUpAppLockPresent: Bool
    @Binding var isAppLockChangeSheetPresent: Bool
    @Binding var appLockPrimaryDismissLock: Bool
    
    @Binding var password: String
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 10)
                VStack(alignment: .leading) {
                    Text("SetupAppLock.Secondary.Title")
                        .font(.system(size: 50, weight: .semibold, design: .rounded))
                    Text("SetUpAppLock.Title.3")
                        .font(.system(size: 20, design: .rounded))
                    Spacer().frame(height: 20)
                    Text("SetUpAppLock.Secondary.SubTitle\(autoTouchID_FaceID)")
                        .font(.system(size: 30, design: .rounded))
                }
                .padding()
                Spacer()
                
            } // Title
            Spacer().frame(height: 30)
            Button {
                let context = LAContext()
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authentication \(autoTouchID_FaceID)") { success, authenticationError in
                    DispatchQueue.main.async {
                        if success {
                            isBioLoginAuthPass = true
                        }
                    }
                }
            } label: {
                HStack{
                    Image(systemName: autoTouchID_FaceIDIcon)
                    Text("SetUpAppLock.Secondary.Authenticate\(autoTouchID_FaceID)")
                }
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous).foregroundColor(.blue))
            }
            if isBioLoginAuthPass {
                Spacer().frame(height: 50)
                NavigationLink {
                    VStack {
                        SetUpAppLockTertiary(
                         isSetUpAppLockPresent: $isSetUpAppLockPresent,
                         isAppLockChangeSheetPresent: $isAppLockChangeSheetPresent,
                         appLockPrimaryDismissLock: $appLockPrimaryDismissLock, password: $password
                        )
                    }
                    .navigationBarTitle("SetUpAppLock.Title")
                } label: {
                    Text("SetUpAppLock.Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous).foregroundColor(.blue))
                }
            }
            Spacer().frame(height: 60)
            NavigationLink {
               SetUpAppLockTertiary(
                isSetUpAppLockPresent: $isSetUpAppLockPresent,
                isAppLockChangeSheetPresent: $isAppLockChangeSheetPresent,
                appLockPrimaryDismissLock: $appLockPrimaryDismissLock, password: $password
               )
                .navigationBarTitle("SetUpAppLock.Title")
            } label: {
                Text("SetUpAppLock.Secondary.Escape")
            }
            Spacer()
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

struct SetUpAppLockSecondary_Previews: PreviewProvider {
    static var previews: some View {
        SetUpAppLockSecondary(
            isBioLoginAuthPass: .constant(false),
            isSetUpAppLockPresent: .constant(false),
            isAppLockChangeSheetPresent: .constant(false),
            appLockPrimaryDismissLock: .constant(false),
            password: .constant("")
        )
    }
}
