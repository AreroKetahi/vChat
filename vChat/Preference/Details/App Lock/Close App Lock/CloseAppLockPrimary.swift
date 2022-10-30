//
//  CloseAppLockPrimary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/6.
//

import SwiftUI

struct CloseAppLockPrimary: View {
//    @Binding var isAppLockChangePasswordBoxPresent: Bool
    @Binding var isAppLockEnable: Bool
//    @Binding var appLockToogleLock: Bool
//    @Binding var isAppLockChangeSheetPresent: Bool
    @Binding var isAppLockSheetPresent: Bool
    @Binding var isCloseAppLockSecPresent: Bool
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isAppLockSheetPresent = false
                } label: {
                    Circle()
                        .foregroundColor(Color("LightGray"))
                        .frame(width: 40)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                        .padding()
                } // Close Button
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
                isCloseAppLockSecPresent = true
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
        .sheet(isPresented: $isCloseAppLockSecPresent) {
           CloseAppLockSecondary(
            isAppLockEnable: $isAppLockEnable,
            isAppLockSheetPresent: $isAppLockSheetPresent,
            isCloseAppLockSecPresent: $isCloseAppLockSecPresent
           )
        }
    }
}

struct CloseAppLockPrimary_Previews: PreviewProvider {
    static var previews: some View {
        CloseAppLockPrimary(
            isAppLockEnable: .constant(false),
            isAppLockSheetPresent: .constant(true),
            isCloseAppLockSecPresent: .constant(false)
        )
    }
}
