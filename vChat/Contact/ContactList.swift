//
//  ContactList.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/21.
//

import SwiftUI

struct ContactList: View {
    @Binding var uiColor: Color
    @Binding var navigationTitle: String
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        List(friendList){ friend in
            NavigationLink {
                ContactPage(person: friend, uiColor: $uiColor)
                    .navigationBarTitle("ContactList.Details")
            } label: {
                PersonLabelComponent(imageName: friend.imageName, nickname: friend.nickname)
            }
        }
        .onAppear {
            navigationTitle = NSLocalizedString("ContactList.Contacts", comment: "super:ContactList")
        }
//        .navigationTitle("Contacts")
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList(uiColor: .constant(.blue), navigationTitle: .constant("Contact"))
    }
}
