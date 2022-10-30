//
//  SignUp.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/7.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to vChat!")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                ZStack {
                    Image("ApplicationIcon")
                        .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
                        .blur(radius: 5)
                    Image("ApplicationIcon")
                        .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
                }
                .padding()
                NavigationLink {
                    SignUpLoginAccount()
                    .navigationBarHidden(true)
                } label: {
                    HStack {
                        Image(systemName: "person.fill.badge.plus")
                        Text("Start your private communication")
                    }
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
                }
                .padding()
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
