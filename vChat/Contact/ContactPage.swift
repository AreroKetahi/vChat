//
//  ContactPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/21.
//

import SwiftUI

struct ContactPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("EmptyHeadImage")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color(.displayP3, red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5), radius: 5)
                .frame(width: 100, height: 100)
//                .padding()
                
                VStack(alignment: .leading) {
                    Text("Zhang San")
                        .font(.title)
                    Text("Nickname: \("Zhang Yiersan")")
                    Text("UID:\("1234567")")
                }
                .padding()
                Spacer()
                
            }
            
            Text("This is your friend witch is added by his/her UID.")
                .font(.headline)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .padding()
    }
}

struct ContactPage_Previews: PreviewProvider {
    static var previews: some View {
        ContactPage()
    }
}
