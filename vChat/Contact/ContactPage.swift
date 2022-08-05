//
//  ContactPage.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/21.
//

import SwiftUI

struct ContactPage: View {
    var person: Person
    @Binding var uiColor: Color
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
                    Text(person.remark ?? person.nickname)
                        .font(.title)
                    
                    HStack {
                        Text("ContactPage.Nickname").bold()
                        Text("\(person.nickname)")
                    }
                    
                    HStack {
                        Text("ContactPage.UID").bold()
                        Text("\(String(person.uid))")
                            .font(.system(size: 18, design: .monospaced))
                    }
                }
                .padding()
                Spacer()
                
            }
            
            Text("ContactPage.DownText")
                .font(.system(size: 15, weight: .light))
                .padding()
            Spacer()
                .frame(height: 30)
            
            NavigationLink{
                ChatPage(friendImageName: person.imageName, selfImageName: selfImageName, objectsVars: VCEnvironmentObjects(), uiColor: $uiColor)
                    .navigationBarTitle(person.remark ?? person.nickname)
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "message.fill")
                        .foregroundColor(.white)
                    Text("ContactPage.SendingMessage")
                        .foregroundColor(.white)
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .frame(height: 50)
                        .foregroundColor(uiColor)
                )
            }
            Spacer()
        }
        .padding()
    }
}

struct ContactPage_Previews: PreviewProvider {
    static var previews: some View {
        ContactPage(person: friendList[0], uiColor: .constant(.blue))
    }
}
