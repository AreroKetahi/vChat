//
//  SignUpFinish.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/7.
//

import SwiftUI

struct SignUpFinish: View {
    var body: some View {
        VStack {
            Text("vChat is ready!")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Image(systemName: "checkmark.circle")
                .foregroundColor(.green)
                .dynamicTypeSize(.accessibility5)
                .padding()
            Text("All settings have been completed.")
                .font(.system(size: 20, weight: .regular, design: .rounded))
            Button {
                
            } label: {
                Text("Finish")
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
        }
    }
}

struct SignUpFinish_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFinish()
    }
}
