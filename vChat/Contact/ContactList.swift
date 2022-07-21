//
//  ContactList.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/21.
//

import SwiftUI

struct ContactList: View {
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        List(friendList){ friend in
            PersonLabelComponent(imageName: friend.imageName, nickname: friend.nickname)
        }
        .navigationTitle("Contacts")
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}
