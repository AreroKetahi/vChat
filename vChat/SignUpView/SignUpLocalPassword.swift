//
//  SignUpLocalPassword.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/7.
//

import SwiftUI

struct SignUpLocalPassword: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            Text("Set up App Lock")
                .padding(.bottom)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Spacer().frame(height: 30)
            Text("SetUpAppLock.Start.Definition.1")
                .font(.title3)
                .padding([.leading, .bottom, .trailing])
            Text("SetUpAppLock.Start.Definition.2")
                .font(.headline)
                .padding(.horizontal)
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "lock.shield")
                    Text("SetUpAppLock.Start.ButtonText")
                }
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .padding()
            }
            .padding()
            NavigationLink {
                SignUpFinish()
            } label: {
                Text("Set App Lock later...")
            }
            Spacer()
        }
    }
}

struct SignUpLocalPassword_Previews: PreviewProvider {
    static var previews: some View {
        SignUpLocalPassword()
    }
}
