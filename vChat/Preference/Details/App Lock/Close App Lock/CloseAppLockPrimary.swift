//
//  CloseAppLockPrimary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct CloseAppLockPrimary: View {
    @Binding var isAppLockChangePasswordBoxPresent: Bool
    @Binding var isAppLockEnable: Bool
    @Binding var appLockToogleLock: Bool
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
                            Text("SetUpAppLock.Cancel")
                                .foregroundColor(.white)
                            Spacer().frame(width: 10)
                        }
                        Spacer().frame(height: 10)
                    }
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).foregroundColor(.blue))
                    .padding()
                }
            }
            Text("CloseAppLock.Primary.Title")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding()
            Image(systemName: "lock.slash.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(width: 280, height: 300)
                .foregroundColor(.blue)
                .padding(.horizontal).padding(.horizontal).padding(.horizontal)
            Text("CloseAppLock.Definition")
                .font(.headline)
                .padding()
            Button {
                isAppLockChangePasswordBoxPresent = true
            } label: {
                HStack {
                    Image(systemName: "lock.slash")
                    Text("CloseAppLock.ButtonText")
                }
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
            Spacer()
        }
    }
    
    private func didAppLockChangeSheetDissmiss() {
        isAppLockEnable.toggle()
        DispatchQueue.main.async {
            appLockToogleLock = false
        }
    }
}

struct CloseAppLockPrimary_Previews: PreviewProvider {
    static var previews: some View {
        CloseAppLockPrimary(isAppLockChangePasswordBoxPresent: .constant(false), isAppLockEnable: .constant(false), appLockToogleLock: .constant(true))
    }
}
